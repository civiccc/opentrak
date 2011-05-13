# == Schema Information
# Schema version: 20110512235335
#
# Table name: opens
#
#  id         :integer         not null, primary key
#  tracker_id :integer
#  ip         :string(255)
#  user_agent :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Open < ActiveRecord::Base
  belongs_to  :tracker
end
