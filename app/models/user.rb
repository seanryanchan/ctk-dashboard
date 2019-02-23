class User < ApplicationRecord
  validates :username, presence: true, length: { maximum: 50 }, uniqueness: {case_sensitive: true}
  validates :password, length: {minimum: 6}, presence: true
  has_many :histories
  has_secure_password
end
