class AddCountToOpen < ActiveRecord::Migration
  def self.up
    add_column :opens, :count, :integer, :default => 1
  end

  def self.down
    remove_column :opens, :count
  end
end
