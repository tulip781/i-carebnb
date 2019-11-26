class DropTableCharities < ActiveRecord::Migration[5.2]
  def change
    drop_table :families
  end
end
