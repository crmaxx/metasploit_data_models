class CreateResnetscansTable < ActiveRecord::Migration
  def change
    create_table :resnetscans do |t|
      t.integer :workspace_id, default: 1, null: false
      t.string :ipaddress
      t.string :hostname
      t.string :macaddress
      t.string :responsetime
      t.string :ports
      t.string :logged
      t.string :langroup
      t.string :os
      t.string :tod
      t.string :users
      t.string :windowsname
      t.string :computermodel
      t.string :status
      t.string :bruteprogress

      t.timestamps null: false
    end
    add_index :resnetscans, :workspace_id
  end
end
