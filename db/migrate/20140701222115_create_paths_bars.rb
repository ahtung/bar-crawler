class CreatePathsBars < ActiveRecord::Migration
  def change
    create_table :bars_paths do |t|
      t.integer :bar_id
      t.integer :path_id
    end
  end
end
