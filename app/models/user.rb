class User < ApplicationRecord
  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
  validates_presence_of :password_digest

  has_secure_password
end
