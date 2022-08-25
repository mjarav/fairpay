class AddDefaultToUsers < ActiveRecord::Migration[6.1]
  def change
    change_column :users, :credit, :integer, default: 0, null: false
  end
end
