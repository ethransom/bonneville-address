class PagesController < ApplicationController
  caches_action :about, :layout => :false

  def about
  end

end
