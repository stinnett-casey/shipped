class ChangeColumnsName < ActiveRecord::Migration[5.0]
  def change
  	rename_column :boat_jobs, :boat_id, :boats_id
  	rename_column :boat_jobs, :job_id, :jobs_id
  end
end
