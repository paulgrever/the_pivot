class RemoveSlugAndUsernameAndRoleFromUser < ActiveRecord::Migration
  def change
    remove_column :users, :slug
    remove_column :users, :username
    remove_column :users, :role
  end
end
