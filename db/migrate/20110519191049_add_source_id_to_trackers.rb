class AddSourceIdToTrackers < ActiveRecord::Migration
  def self.up
    add_column :trackers, :source_id, :integer
  end

  def self.down
    remove_column :trackers, :source_id
  end
end
