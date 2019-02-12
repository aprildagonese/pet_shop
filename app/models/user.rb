class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true
  validates :username, uniqueness: true, presence: true
  validates :password_digest, presence: true

  enum role: %w(default admin registered store_mgr)

end
