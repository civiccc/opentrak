class AddTotalViewsToTrackers < ActiveRecord::Migration
  def self.up
    add_column :trackers, :total_views, :integer, :default => 0
    
    Tracker.all.each do |x|
      x.update_attribute(:total_views, x.calc_total_views)
    end
  end

  def self.down
    remove_column :trackers, :total_views
  end
end
