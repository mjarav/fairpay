class Review < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :content, presence: true
  validates :rating, numericality: { only_integer: true}
  validates :rating, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 5 }
end
