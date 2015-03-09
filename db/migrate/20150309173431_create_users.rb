class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :full_name
      t.string :display_name
      t.string :username
      t.string :password_digest
      t.integer :role, default: 0
    end
  end
end
