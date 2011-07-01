class TagsController < ApplicationController
  
  def index
  end
  
  def show
    @tag = ActsAsTaggableOn::Tag.find(params[:id])
    @trackers = Tracker.tagged_with(@tag.name)
    
    @total_sent = @trackers.map(&:total_sent).inject{|a,b| a+b}
    @opens = @trackers.map(&:count).inject{|a,b| a+b}
    
    if(@total_sent>0 && @opens > 0)
      @open_rate = (@opens.to_f / @total_sent.to_f)*100
    else
      @open_rate = 0
    end
    
  end
  
end
