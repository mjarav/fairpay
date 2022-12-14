class AddColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :nickname, :string
    add_column :users, :language, :string
    add_column :users, :bio, :text
    add_column :users, :credit, :integer
  end
end
