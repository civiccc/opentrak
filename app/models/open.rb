# == Schema Information
# Schema version: 20110516211824
#
# Table name: opens
#
#  id         :integer         not null, primary key
#  tracker_id :integer
#  ip         :string(255)
#  user_agent :string(255)
#  created_at :datetime
#  updated_at :datetime
#  count      :integer         default(0)
#

class Open < ActiveRecord::Base
  belongs_to  :tracker
end
