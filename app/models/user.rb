class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :password, length: { minimum: 6, maximum: 18 }
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true
end
