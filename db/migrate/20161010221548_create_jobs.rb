class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.text :description
      t.string :origin
      t.string :destination
      t.decimal :cost
      t.integer :number_of_containers

      t.timestamps
    end
  end
end
