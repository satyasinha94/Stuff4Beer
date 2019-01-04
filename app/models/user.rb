class User < ApplicationRecord
  has_many :listings, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_secure_password
end
