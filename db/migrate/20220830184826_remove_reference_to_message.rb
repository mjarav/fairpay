class RemoveReferenceToMessage < ActiveRecord::Migration[6.1]
  def change
    remove_reference :chatrooms, :message, foreign_key: true
  end
end
