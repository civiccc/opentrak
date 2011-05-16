class AddViewsToTracker < ActiveRecord::Migration
  def self.up
    add_column :trackers, :views, :integer, :default=>0
  end

  def self.down
    remove_column :trackers, :views
  end
end
