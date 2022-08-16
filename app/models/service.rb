class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy

  validates :name, :description, :location, presence: true
  validate :any_present?

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

  def any_present?
    if %w(monday tuesday wednesday thursday friday saturday sunday).all?{|attr| self[attr].blank?}
      errors.add :base, "at least pick a day in a week"
    end
  end
end
