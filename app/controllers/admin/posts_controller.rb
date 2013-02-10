class Admin::PostsController < Admin::AdminController
  # GET /admin/posts
  # GET /admin/posts.json
  def index
    @posts = Post.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @posts }
    end
  end

  # GET /admin/posts/1
  # GET /admin/posts/1.json
  def show
    @post = Post.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @post }
    end
  end

  # GET /admin/posts/new
  # GET /admin/posts/new.json
  def new
    @post = Post.new
    @authors = Author.all # for the option select
    @sections = Section.all

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @post }
    end
  end

  # GET /admin/posts/1/edit
  def edit
    @post = Post.find(params[:id])
    @authors = Author.all # for the option select
    @sections = Section.all
  end

  # POST /admin/posts
  # POST /admin/posts.json
  def create
    @post = Post.new(params[:post])

    respond_to do |format|
      if @post.save
        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully created.' }
        format.json { render json: @post, status: :created, location: @post }
      else
        format.html { render action: "new" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /admin/posts/1
  # PUT /admin/posts/1.json
  def update
    @post = Post.find(params[:id])
    @authors = Author.all
    @sections = Section.all

    respond_to do |format|
      if @post.update_attributes(params[:post])
        format.html { redirect_to admin_post_path(@post), notice: 'Post was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admin/posts/1
  # DELETE /admin/posts/1.json
  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to admin_posts_url }
      format.json { head :ok }
    end
  end
end
