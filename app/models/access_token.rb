# == Schema Information
# Schema version: 20110701233142
#
# Table name: access_tokens
#
#  id          :integer         not null, primary key
#  user_id     :integer
#  token       :string(255)
#  active      :boolean
#  last_access :datetime
#  created_at  :datetime
#  updated_at  :datetime
#

class AccessToken < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :token, :presence => true, :uniqueness => true
  belongs_to  :user
  
  def stamp_accessed
    update_attribute(:last_access, Time.now)
  end
  
end
