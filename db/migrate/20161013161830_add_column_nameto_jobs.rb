class AddColumnNametoJobs < ActiveRecord::Migration[5.0]
  def change
  	add_column :jobs, :name, :string
  	add_index :jobs, :name, :unique => true
  end
end
