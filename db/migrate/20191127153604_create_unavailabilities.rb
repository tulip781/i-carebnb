class CreateUnavailabilities < ActiveRecord::Migration[5.2]
  def change
    create_table :unavailabilities do |t|
      t.references :room, foreign_key: true
      t.date :date

      t.timestamps
    end
  end
end
