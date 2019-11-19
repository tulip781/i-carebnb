class AddColumnToRoom < ActiveRecord::Migration[5.2]
  def change
    add_column :rooms, :image_url, :string
    add_column :rooms, :title, :string
  end
end
