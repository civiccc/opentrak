# == Schema Information
# Schema version: 20110620211711
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
#  views      :integer         default(0)
#  source_id  :integer
#

class Tracker < ActiveRecord::Base
  acts_as_taggable
  has_many  :opens, :dependent => :destroy
  
  def increment(x=1)
    update_attributes(:count => count+x, :views => views+x)
  end
  
  def increment_sent(x=1)
    update_attributes(:total_sent => total_sent+x)
  end
  
  def open_rate
    if(total_sent>0)
      return (count.to_f / total_sent.to_f)*100
    else
      return 0.to_f
    end
  end
    
  def calculate_views
    x = 0
    opens.inject(0) do |a, b|
      x = a+b.count
    end
    
    return x
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
