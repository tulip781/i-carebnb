class CreateSafeguardings < ActiveRecord::Migration[5.2]
  def change
    create_table :safeguardings do |t|
      t.references :resident, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :approved, default: false

      t.timestamps
    end
  end
end
