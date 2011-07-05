class AccessTokensController < ApplicationController
  # GET /access_tokens
  # GET /access_tokens.xml
  def index
    @access_tokens = AccessToken.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @access_tokens }
    end
  end

  # GET /access_tokens/1
  # GET /access_tokens/1.xml
  def show
    @access_token = AccessToken.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @access_token }
    end
  end

  # GET /access_tokens/new
  # GET /access_tokens/new.xml
  def new
    @access_token = AccessToken.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @access_token }
    end
  end

  # GET /access_tokens/1/edit
  def edit
    @access_token = AccessToken.find(params[:id])
  end

  # POST /access_tokens
  # POST /access_tokens.xml
  def create
    require 'digest/sha1'
    
    @access_token = AccessToken.new
    @access_token.user_id = current_user.id
    @access_token.last_access = Time.now
    @access_token.token = Digest::SHA1.hexdigest Time.now.to_s
    @access_token.active = true
    
    respond_to do |format|
      if @access_token.save
        format.html { redirect_to(@access_token, :notice => 'Access token was successfully created.') }
        format.xml  { render :xml => @access_token, :status => :created, :location => @access_token }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @access_token.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /access_tokens/1
  # PUT /access_tokens/1.xml
  def update
    @access_token = AccessToken.find(params[:id])

    respond_to do |format|
      if @access_token.update_attributes(params[:access_token])
        format.html { redirect_to(@access_token, :notice => 'Access token was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @access_token.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /access_tokens/1
  # DELETE /access_tokens/1.xml
  def destroy
    @access_token = AccessToken.find(params[:id])
    @access_token.destroy

    respond_to do |format|
      format.html { redirect_to(access_tokens_url) }
      format.xml  { head :ok }
    end
  end
end
