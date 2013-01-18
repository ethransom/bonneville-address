class PostSweeper < ActionController::Caching::Sweeper
  observe Post
  
  def after_save(post)
    clear_posts_cache(post)
  end
  
  def after_destroy(post)
    clear_posts_cache(post)
  end

  private
  
  def clear_posts_cache(post)
  	expire_action :controller => :posts, :action => :index
    expire_fragment "post-#{post.slug}"
    expire_fragment "post-small-#{post.slug}"
  end
end