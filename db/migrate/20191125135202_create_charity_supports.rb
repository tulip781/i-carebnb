class CreateCharitySupports < ActiveRecord::Migration[5.2]
  def change
    create_table :charity_supports do |t|
      t.references :user, foreign_key: true
      t.references :charity, foreign_key: true
      t.string :newsletter

      t.timestamps
    end
  end
end
