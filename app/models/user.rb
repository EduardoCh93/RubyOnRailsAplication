class User < ApplicationRecord
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\a-z+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i.freeze
  validates :email, presence: true, length: { maximum: 250 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
  has_secure_password
  validates :password, length: { minimum: 8 }, on: :create
  validates :password_confirmation, presence: true
  has_many :posts, dependent: :destroy
  has_many :reposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_posts, :through => :likes, :source => :post

  class << self
    def digest(string)
      cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST:
                 BCrypt::Engine.cost
      BCrypt::Password.create(string, cost: cost)
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    return false if remember_digest.nil?

    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  def feed
    followings_posts + followings_reposts
  end

  def followings_posts
    followings_ids = followings.map(&:id_usuario)
    Post.where('user_id IN (?) OR user_id = ?', followings_ids, id)
  end

  def followings_reposts
    followings_ids = followings.map(&:id_usuario)
    Repost.where('user_id IN (?) OR user_id = ?', followings_ids, id)
  end

  has_many :followers
  has_many :followings

  def following?(other_user)
    followings.any? { |following| following.id_usuario == other_user.id }
  end

end
