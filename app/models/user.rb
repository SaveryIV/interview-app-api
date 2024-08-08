class User < ApplicationRecord
  require "securerandom"
  has_secure_password
  has_many :contents, foreign_key: 'author_id'

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true
end
