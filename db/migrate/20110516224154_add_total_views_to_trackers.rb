class AddTotalViewsToTrackers < ActiveRecord::Migration
  def self.up
    add_column :trackers, :total_views, :integer, :default => 0
  end

  def self.down
    remove_column :trackers, :total_views
  end
end
