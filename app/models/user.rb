class User < ApplicationRecord
  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, format: {with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/}
  has_secure_password
end
