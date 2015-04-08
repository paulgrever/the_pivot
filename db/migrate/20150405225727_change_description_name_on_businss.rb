class ChangeDescriptionNameOnBusinss < ActiveRecord::Migration
  def change
    rename_column :businesses, :discription, :description
  end
end
