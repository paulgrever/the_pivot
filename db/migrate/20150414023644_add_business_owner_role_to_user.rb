class AddBusinessOwnerRoleToUser < ActiveRecord::Migration
  def change
    add_column :users, :business_owner, :boolean, default: false
  end
end
