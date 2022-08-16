class Category < ApplicationRecord
  validates :name, :image, presence: true
end
