# == Schema Information
# Schema version: 20110701202911
#
# Table name: access_tokens
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  token       :string(255)
#  active      :boolean         default(TRUE)
#  last_access :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class AccessToken < ActiveRecord::Base
end
