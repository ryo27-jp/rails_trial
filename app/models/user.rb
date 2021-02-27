class User < ApplicationRecord
  has_secure_password

  validates :name, presence: true, length: { maximum: 20 }
  validates :email, uniqueness: true, presence: true
  validates :password, presence: true, confirmation: true
  validates :password_confirmation, presence: true
end
