class AddReadToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chats, :read, :boolean, default: false
  end
end
