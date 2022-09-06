class RemoveServiceFromChatroom < ActiveRecord::Migration[6.1]
  def change
    remove_reference :chatrooms, :service
  end
end
