class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 50 }
  validates :password, length: {minimum: 6}, presence: true
  has_secure_password
end
