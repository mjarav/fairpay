class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :service

  enum status: [:pending, :declined, :accepted, :completed]

  def format_status_for(user_type)
    return "Waiting" if pending? && user_type == :customer

    status.capitalize
  end
end
