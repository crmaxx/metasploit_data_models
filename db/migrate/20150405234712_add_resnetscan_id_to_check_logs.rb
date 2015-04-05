class AddResnetscanIdToCheckLogs < ActiveRecord::Migration
  def change
    add_column :check_logs, :resnetscan_id, :integer, null: false
  end
end
