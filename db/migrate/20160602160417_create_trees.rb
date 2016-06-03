class CreateTrees < ActiveRecord::Migration
  def change
    create_table :trees do |t|
      t.string :node
      t.string :left
      t.string :right

      t.timestamps null: false
    end
  end
end
