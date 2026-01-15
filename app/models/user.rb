class User < ApplicationRecord
  # Makes use of password digest to add a password and password confirmation that does not get addded to the database but bycrypts it
  has_secure_password
end
