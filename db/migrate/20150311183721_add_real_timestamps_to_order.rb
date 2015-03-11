class AddRealTimestampsToOrder < ActiveRecord::Migration
  def self.up 
  	remove_column :orders, :created_at
    remove_column :orders, :updated_at
    change_table :orders do |t|
      t.timestamps
    end
	end

	def self.down 
    remove_column :orders, :created_at
    remove_column :orders, :updated_at
	end
end
