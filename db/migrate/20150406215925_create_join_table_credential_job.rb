class CreateJoinTableCredentialJob < ActiveRecord::Migration
  def change
    create_table :credentials_jobs, id: false do |t|
      t.integer :credential_id, null: false
      t.integer :job_id, null: false
    end

    add_index :credentials_jobs, [:credential_id, :job_id]
    add_index :credentials_jobs, [:job_id, :credential_id]
  end
end
