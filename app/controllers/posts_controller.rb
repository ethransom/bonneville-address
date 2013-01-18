# NOTE: only the read-only version
# see admin/posts_controller.rb for scaffolded control

class PostsController < ApplicationController
  cache_sweeper :post_sweeper

  # GET /posts
  # GET /posts.xml
  def index
    @posts = Post.order("created_at DESC").page(params[:page]).per(5)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @posts }
    end
  end

  # GET /posts/1
  # GET /posts/1.xml
  def show
    # only hit the DB if we need to re-cache
    @post = Post.find(params[:id]) unless fragment_exist?("post-#{params[:id]}")

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @post }
    end
  end

  def feed
  	@posts = Post.find(:all, :order => 'id DESC', :limit => 10)
  	render :layout => false
  	response.headers["Content-Type"] = "application/xml; charset=utf-8"
  end
end
