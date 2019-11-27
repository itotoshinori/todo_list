Rails.application.routes.draw do
  
  resources :blogs
  #get 'portals/:id/edit'
  get '/'=>'portals#index'
  
  resources :portals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
