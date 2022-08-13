class Review < ApplicationRecord
  belongs_to :service
  belongs_to :user

  validates :content, presence: true
end
