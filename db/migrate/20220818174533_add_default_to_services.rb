class AddDefaultToServices < ActiveRecord::Migration[6.1]
  def change
    change_column :services, :monday, :boolean, default: false
    change_column :services, :tuesday, :boolean, default: false
    change_column :services, :wednesday, :boolean, default: false
    change_column :services, :thursday, :boolean, default: false
    change_column :services, :friday, :boolean, default: false
    change_column :services, :saturday, :boolean, default: false
    change_column :services, :sunday, :boolean, default: false
  end
end
