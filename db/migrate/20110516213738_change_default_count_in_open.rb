class ChangeDefaultCountInOpen < ActiveRecord::Migration
  def self.up
    change_column :opens, :count, :integer, :default => 0
  end

  def self.down
    change_column :opens, :count, :integer, :default => 1
  end
end
