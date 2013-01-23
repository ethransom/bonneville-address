class AuthorsController < ApplicationController
  def show
    @author = Author.find(params[:id])
    @posts = @author.posts.order("created_at DESC").page(params[:page]).per(5)
  end

  def index
    @authors = Author.all
  end
end
