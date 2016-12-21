class AddIndexToBoat < ActiveRecord::Migration[5.0]
  def change
  	add_index :boats, :name, :unique => true
  end
end
