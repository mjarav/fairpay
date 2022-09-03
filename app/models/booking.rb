class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  validates :start_date, :description, presence: true, on: :create
  validate :start_date_after_today

  enum status: [:approve, :declined, :accepted, :completed, :reviewed]

  def format_status_for(user_type)
    return "Waiting" if approve? && user_type == :customer

    status.capitalize
  end

  def accept!
    update(status: :accepted)
  end

  def decline!
    update(status: :declined)
  end

  def complete!
    update(status: :completed)
  end

  def review!
    update(status: :reviewed)
  end

  private

  def start_date_after_today

    return if start_date.blank?

    if start_date < Date.today && status != "completed" && status != "declined"  && status != "reviewed"
      errors.add(:start_date, "must be after today")
    end
  end
end
