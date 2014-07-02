class AddEndAddressToPaths < ActiveRecord::Migration
  def change
    add_column :paths, :end_address, :string
  end
end
