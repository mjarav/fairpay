class CreateChatrooms < ActiveRecord::Migration[6.1]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :service, null: false, foreign_key: true
      t.references :customer, foreign_key: { to_table: :users }
      t.references :provider, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
