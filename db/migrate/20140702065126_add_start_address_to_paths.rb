class AddStartAddressToPaths < ActiveRecord::Migration
  def change
    add_column :paths, :start_address, :string
  end
end
