class CreateRovers < ActiveRecord::Migration
  def change
    create_table :rovers do |t|
      t.string :name
      t.integer :position_x
      t.integer :position_y
      t.string :direction

      t.timestamps null: false
    end
  end
end
