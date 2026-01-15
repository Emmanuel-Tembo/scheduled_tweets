class User < ApplicationRecord
  # Makes use of password digest to add a password and password confirmation that does not get addded to the database but bycrypts it
  has_secure_password

  # Validations
  validates :email, presence: true, format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "must be a valid email address",uniqueness: true }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true

end
