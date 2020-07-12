class Post < ApplicationRecord
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  has_many :reposts, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, :through => :likes, :source => :user
end
