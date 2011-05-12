class CreateTrackers < ActiveRecord::Migration
  def self.up
    create_table :trackers do |t|
      t.string :name
      t.integer :count, :default => 0
      t.string :title
      t.integer :total_sent, :default => 0

      t.timestamps
    end
  end

  def self.down
    drop_table :trackers
  end
end
