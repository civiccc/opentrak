class TrackersController < ApplicationController
  before_filter :admin_user, :except => [:track, :blocked]
  require "pathname"
  
  # GET /trackers
  # GET /trackers.xml
  def index
    @trackers = Tracker.all

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
    raise request.env.inspect
    
    @tracker = Tracker.find_or_create(params[:name])
    
    # is there an existing one?
    @open = Open.find_by_tracker_id_and_ip(@tracker.id, request.env["REMOTE_ADDR"])
    if(@open.nil?)
      @tracker.increment
      Open.create!(:tracker_id => @tracker.id, :ip => request.env["REMOTE_ADDR"])
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
    
  end
  
  private
  
  def admin_user
    if (params[:secret] == "derwiki")
      return true
    else
      redirect_to(root_path)
    end
  end
  
end
