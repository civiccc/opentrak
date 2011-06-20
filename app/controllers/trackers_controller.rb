class TrackersController < ApplicationController
  before_filter :admin_user, :except => [:track, :blocked]
  require "pathname"
  
  # GET /trackers
  # GET /trackers.xml
  def index
    @trackers = Tracker.find(:all, :order => "id DESC").paginate(:page => params[:page], :per_page => 40)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @trackers }
    end
  end

  # GET /trackers/1
  # GET /trackers/1.xml
  def show
    @tracker = Tracker.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @tracker }
    end
  end

  # GET /trackers/new
  # GET /trackers/new.xml
  def new
    @tracker = Tracker.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @tracker }
    end
  end

  # GET /trackers/1/edit
  def edit
    @tracker = Tracker.find(params[:id])
  end

  # POST /trackers
  # POST /trackers.xml
  def create    
    @tracker = Tracker.new(params[:tracker])

    respond_to do |format|
      if @tracker.save
        format.html { redirect_to(@tracker, :notice => 'Tracker was successfully created.') }
        format.xml  { render :xml => @tracker, :status => :created, :location => @tracker }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @tracker.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  def track
    ip = env["HTTP_X_FORWARDED_FOR"]
    
    @tracker = Tracker.find_or_create(params[:name])
    
    # is there an existing one?
    @open = Open.find_by_tracker_id_and_ip(@tracker.id, ip)
    if(@open.nil?)
      @tracker.increment
      Open.create!(:tracker_id => @tracker.id, :ip => ip, :count => 1)
    else
      # increment the count of the Open
      @tracker.update_attribute(:views, @tracker.views+1)
      @open.update_attribute(:count, @open.count+1)
    end
    
    file = Rails.root.join("public/images/pixel.gif").to_s
    send_file file, :type => 'image/gif', :disposition => 'inline'
  end

  # PUT /trackers/1
  # PUT /trackers/1.xml
  def update
    @tracker = Tracker.find(params[:id])

    respond_to do |format|
      if @tracker.update_attributes(params[:tracker])
        format.html { redirect_to(@tracker, :notice => 'Tracker was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @tracker.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /trackers/1
  # DELETE /trackers/1.xml
  def destroy
    @tracker = Tracker.find(params[:id])
    @tracker.destroy

    respond_to do |format|
      format.html { redirect_to(trackers_url) }
      format.xml  { head :ok }
    end
  end
  
  def blocked
    if(user_signed_in? && current_user.admin?)
      redirect_to trackers_path
    end
  end
  
end
