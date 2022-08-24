class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

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

def start_date_in_future
  return if start_date.blank?
  return if start_date >= Date.current
  errors.add(:start_date, :invalid)
end



end
