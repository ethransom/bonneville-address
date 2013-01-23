class SectionsController < ApplicationController
  def show
    @section = Section.find(params[:id])
    @posts = @section.posts.order("created_at DESC").page(params[:page]).per(5)
  end

  def index
    @sections = Section.all
  end
end
