class AddDescriptionToBookings < ActiveRecord::Migration[6.1]
  def change
    add_column :bookings, :description, :string
  end
end
