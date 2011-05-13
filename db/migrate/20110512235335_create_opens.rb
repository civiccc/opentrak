class CreateOpens < ActiveRecord::Migration
  def self.up
    create_table :opens do |t|
      t.integer :tracker_id
      t.string :ip
      t.string :user_agent

      t.timestamps
    end
  end

  def self.down
    drop_table :opens
  end
end
