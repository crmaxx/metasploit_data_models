class CreateCredsJobsTable < ActiveRecord::Migration
  def change
    create_table :creds_jobs, id: false do |t|
      t.integer :cred_id, null: false
      t.integer :job_id, null: false
    end
    add_index :creds_jobs, [:cred_id, :job_id], name: "unique_creds_jobs", unique: true
  end
end
