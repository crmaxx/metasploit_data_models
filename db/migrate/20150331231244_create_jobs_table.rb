class CreateJobsTable < ActiveRecord::Migration
  def change
    create_table :jobs do |t|
      t.integer :workspace_id, default: 1, null: false
      t.string :name, null: false
      t.text :description
      t.string :status, null: false, default: 'new'

      t.timestamps null: false
    end
    add_index :jobs, :workspace_id
  end
end
