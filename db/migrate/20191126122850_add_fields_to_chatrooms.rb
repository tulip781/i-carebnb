class AddFieldsToChatrooms < ActiveRecord::Migration[5.2]
  def change
    add_column :chatrooms, :sender_id, :integer
    add_column :chatrooms, :recipient_id, :integer

    add_index :chatrooms, :sender_id
    add_index :chatrooms, :recipient_id
    add_index :chatrooms, [:sender_id, :recipient_id], unique: true
  end
end
