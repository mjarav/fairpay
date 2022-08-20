class AddDefaultToBookings < ActiveRecord::Migration[6.1]
  def change
    change_column :bookings, :status, :integer, default: false, null: false
  end
end
