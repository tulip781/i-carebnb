class AddFamilyMembersToGuests < ActiveRecord::Migration[5.2]
  def change
    add_column :guests, :adult_space, :integer, default: 1
    add_column :guests, :child_space, :integer
    add_column :guests, :infant_space, :integer
  end
end
