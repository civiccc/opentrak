class ApiController < ApplicationController
  before_filter :valid_token
  before_filter :valid_tracker
  
  def post
    action_type = params[:action_type]
    
    case action_type
    when 'increment_sent'
      # ensure that we're incrementing by a positive number
      increment_by = params[:increment_by].to_i
      if increment_by <= 0
        render :json => { :success => false, :error => "Cannot increment by given value"}.to_json
      else
        # increment the count
        @tracker.increment_sent(increment_by)
        # update the stamp
        @token.stamp_accessed
        # return success
        render :json => render_tracker(@tracker)
      end
    else
      render :json => { :success => false, :error => "Invalid action"}.to_json
    end
    
  end

  private

  def render_tracker(tracker)
    {
      :success => true,
      :name => tracker.name,
      :open_rate => tracker.open_rate,
      :total_sent => tracker.total_sent,
      :count => tracker.count,
      :views => tracker.views,
      :source_id => tracker.source_id
    }.to_json
  end
  
  def valid_token
    @token = AccessToken.find_by_token(params[:access_token])
    render :json => { :success => false, :error => "Invalid access token"}.to_json if @token.nil? || !@token.active?
  end
  
  def valid_tracker
    @tracker = Tracker.find_by_name(params[:tracker])
    render :json => { :success => false, :error => "Invalid tracker"}.to_json if @tracker.nil?
  end
  
end
