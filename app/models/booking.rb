class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :start_date, :description, presence: true, on: :create
  validate :start_date_after_today

  enum status: [:pending, :declined, :accepted, :completed]

  def format_status_for(user_type)
    return "Waiting" if pending? && user_type == :customer

    status.capitalize
  end

  def accept!
    update(status: :accepted)
  end

  def decline!
    update(status: :declined)
  end

  private

  def start_date_after_today
    return if start_date.blank?

    if start_date < Date.today
      errors.add(:start_date, "must be after today")
    end
 end

end
