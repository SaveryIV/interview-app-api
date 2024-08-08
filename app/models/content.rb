class Content < ApplicationRecord
  belongs_to :author, class_name: 'User'
  
  validates :title, presence: true, uniqueness: false
  validates :description, presence: true
  validates :category, presence: true
  validates :thumbnail_url, presence: true
  validates :content_url, presence: true
end
