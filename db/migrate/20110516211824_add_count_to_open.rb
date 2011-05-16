class AddCountToOpen < ActiveRecord::Migration
  def self.up
    add_column :opens, :count, :integer, :default => 1
    
    Open.all.each do |x|
      x.update_attribute(:count, 1)
    end
  end

  def self.down
    remove_column :opens, :count
  end
end
