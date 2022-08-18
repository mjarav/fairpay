class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy

  validates :name, :description, :location, :category_id, presence: true
  validate :any_present

  include PgSearch::Model

  pg_search_scope :global_search,
    against: [:name, :description, :location],
    associated_against: {
      user: [:email, :nickname, :first_name, :last_name, :language],
      category: :name
      },
    using: {
      tsearch: { prefix: true }
    }

  def any_present
    errors.add(:base, 'Select at least one day') unless
    monday? || tuesday? || wednesday? || thursday? || friday? ||
    saturday? || sunday?
  end
end
