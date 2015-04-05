class CreateCheckLogsTable < ActiveRecord::Migration
  def change
    create_table :check_logs do |t|
      t.integer :workspace_id, default: 1, null: false
      t.integer :job_id, null: false
      t.text :message

      t.timestamps null: false
    end
    add_index :check_logs, :workspace_id
    add_index :check_logs, :job_id
  end
end
