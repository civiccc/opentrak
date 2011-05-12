class Tracker < ActiveRecord::Base
  
  def increment
    update_attribute(:count, count+1)
  end
    
  def self.find_or_create(tracker_name)
    @tracker = Tracker.find_by_name(tracker_name)
    
    if(@tracker)
      return @tracker
    else
     return Tracker.create!(:name => tracker_name, :count => 0)
    end
    
  end
  
end
