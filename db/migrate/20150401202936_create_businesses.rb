class CreateBusinesses < ActiveRecord::Migration
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :discription
      t.references :user, index: true
    end
    add_foreign_key :businesses, :users
  end
end
