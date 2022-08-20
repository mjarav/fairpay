class Category < ApplicationRecord
  has_many :services, dependent: :destroy

  validates :name, :image, presence: true
end
