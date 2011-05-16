class DropTotalViews < ActiveRecord::Migration
  def self.up
    remove_column :trackers, :total_views
  end

  def self.down
  end
end
