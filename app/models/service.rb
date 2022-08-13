class Service < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :bookings, dependent: :destroy

  validates :name, :description, :location, presence: true
  validate :any_present?

  def any_present?
    if %w(monday tuesday wednesday thursday friday saturday sunday).all?{|attr| self[attr].blank?}
      errors.add :base, "at least pick a day in a week"
    end
  end

end
