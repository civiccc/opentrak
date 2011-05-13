# == Schema Information
# Schema version: 20110512235335
#
# Table name: trackers
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  count      :integer         default(0)
#  title      :string(255)
#  total_sent :integer         default(0)
#  created_at :datetime
#  updated_at :datetime
#

class Tracker < ActiveRecord::Base
  has_many  :opens, :dependent => :destroy
  
  def increment
    update_attribute(:count, count+1)
  end
  
  def open_rate
    if(total_sent>0)
      return (count.to_f / total_sent.to_f)*100
    else
      return 0
    end
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
