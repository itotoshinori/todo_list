Rails.application.routes.draw do
  
  get 'login/index'
  post 'login/login'
  resources :blogs
  #get 'portals/:id/edit'
  get '/'=>'portals#index'
  post 'blogs/commentcreate'
  resources :comments
  resources :portals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
