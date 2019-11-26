class ChangeNewsletterToBeBooleanInCharitySupports < ActiveRecord::Migration[5.2]
  def change
    remove_column :charity_supports, :newsletter
    # change_column :charity_supports, :newsletter, :boolean
    add_column :charity_supports, :newsletter, :boolean
  end
end
