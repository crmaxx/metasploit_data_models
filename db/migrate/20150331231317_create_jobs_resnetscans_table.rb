class CreateJobsResnetscansTable < ActiveRecord::Migration
  def change
    create_table :jobs_resnetscans, id: false do |t|
      t.integer :job_id, null: false
      t.integer :resnetscan_id, null: false
    end
    add_index :jobs_resnetscans, [:job_id, :resnetscan_id], name: "unique_jobs_resnetscans", unique: true
  end
end
