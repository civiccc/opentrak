class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :admin_user
  
  def admin_user
    if !current_user.nil? && current_user.admin?
      true
    else
      redirect_to root_path, :notice => "You are not authorized to view this page."
    end
  end

end
