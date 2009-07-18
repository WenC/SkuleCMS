class SmallPostsController < ApplicationController
  

  # GET /small_posts
  # GET /small_posts.xml
  def index
    @small_posts = SmallPost.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml {} #{ render :xml => @small_posts }
    end
  end

  # GET /small_posts/1
  # GET /small_posts/1.xml
  def show
    @small_post = SmallPost.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @small_post }
    end
  end

  # GET /small_posts/new
  # GET /small_posts/new.xml
  def new
    @small_post = SmallPost.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @small_post }
    end
  end

  # GET /small_posts/1/edit
  def edit
    @small_post = SmallPost.find(params[:id])
  end

  # POST /small_posts
  # POST /small_posts.xml
  def create
    @small_post = SmallPost.new(params[:small_post])
    
    
 
    

    respond_to do |format|
      if params[:commit] == "Try a Twat"
        #redirect
        format.html { redirect_to :controller => "large_posts", :action => "new", :content => params[:small_post][:content] }
      else
        #save normally as a twit
        if @small_post.save
          flash[:notice] = 'SmallPost was successfully created.'
          format.html { redirect_to(@small_post) }
          format.xml  { render :xml => @small_post, :status => :created, :location => @small_post }
        else
          format.html { render :action => "new" }
          format.xml  { render :xml => @small_post.errors, :status => :unprocessable_entity }
        end
      end
    end
  end

  # PUT /small_posts/1
  # PUT /small_posts/1.xml
  def update
    @small_post = SmallPost.find(params[:id])

    respond_to do |format|
      if @small_post.update_attributes(params[:small_post])
        flash[:notice] = 'SmallPost was successfully updated.'
        format.html { redirect_to(@small_post) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @small_post.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /small_posts/1
  # DELETE /small_posts/1.xml
  def destroy
    @small_post = SmallPost.find(params[:id])
    @small_post.destroy

    respond_to do |format|
      format.html { redirect_to(small_posts_url) }
      format.xml  { head :ok }
    end
  end
end
