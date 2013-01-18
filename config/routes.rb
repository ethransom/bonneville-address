Blog::Application.routes.draw do


  resources :authors

  namespace :admin do
    resources :posts
  end

  match "/about" => "pages#about", :as => :about

  resources :posts do
    get 'page/:page', :action => :index, :on => :collection
  end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  root :to => "posts#index"

  match "page/:page" => "posts#index"

  # See how all your routes lay out with "rake routes"
end
