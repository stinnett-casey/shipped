class ChangeM2MTable < ActiveRecord::Migration[5.0]
  def change
  	rename_column :boat_jobs, :boats_id, :boat_id
  	rename_column :boat_jobs, :jobs_id, :job_id
  end
end
