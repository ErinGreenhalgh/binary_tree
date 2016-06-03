class ChangeTypes < ActiveRecord::Migration
  def change
    change_column :nodes, :value, :integer
    remove_column :nodes, :left
    remove_column :nodes, :right
  end
end
