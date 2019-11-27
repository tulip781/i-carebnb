class AddChatroomidToChats < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :chatroom_id, :integer
  end
end
