class ChangeTreesTableToNodes < ActiveRecord::Migration
  def change
    rename_column :trees, :node, :value
    rename_table :trees, :nodes
  end
end
