class AccessToken < ActiveRecord::Base
  validates :user_id, :presence => true
  validates :token, :presence => true, :uniqueness => true
  belongs_to  :user
  
end
