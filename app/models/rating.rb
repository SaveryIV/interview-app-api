class Rating < ApplicationRecord
  belongs_to :user
  belongs_to :content

  validates :stars, presence: true, inclusion: { in: 1..5 }
end
