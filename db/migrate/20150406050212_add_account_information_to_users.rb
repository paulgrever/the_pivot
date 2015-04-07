class AddAccountInformationToUsers < ActiveRecord::Migration
  def change
    add_column :users, :shipping_address, :string
    add_column :users, :billing_address, :string
    add_column :users, :credit_card, :string
  end
end
