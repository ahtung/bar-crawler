class CreatePaths < ActiveRecord::Migration
  def change
    create_table :paths do |t|
      t.float :start_lat
      t.float :start_long
      t.float :end_lat
      t.float :end_long

      t.timestamps
    end
  end
end
