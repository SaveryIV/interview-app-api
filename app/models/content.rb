class Content < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :ratings, dependent: :destroy
  has_many :raters, through: :ratings, source: :user
  
  def average_rating
    return 0 if ratings.empty?
    ratings.average(:stars).round(2)
  end

  validates :title, presence: true, uniqueness: false
  validates :description, presence: true
  validates :category, presence: true
  validates :thumbnail_url, presence: true
  validates :content_url, presence: true
end
