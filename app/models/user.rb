class User < ApplicationRecord
  require "securerandom"
  has_secure_password
  has_many :contents, foreign_key: 'author_id', dependent: :destroy
  has_many :ratings, dependent: :destroy
  has_many :rated_contents, through: :ratings, source: :content

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :password, presence: true, length: { minimum: 6 }
  validates :username, presence: true, uniqueness: true
  validates :name, presence: true
end
