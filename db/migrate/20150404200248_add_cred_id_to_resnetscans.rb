class AddCredIdToResnetscans < ActiveRecord::Migration
  def change
    add_column :resnetscans, :cred_id, :integer
  end
end
