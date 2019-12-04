Rails.application.routes.draw do
  
  get 'login/index'
  post 'login/login'
  resources :blogs
  #get 'portals/:id/edit'
  get '/'=>'portals#index'
  #get '/comments/comment_error'
  post '/comments/comment_error', as: :comment_error
  #post '/comments/test'
  get '/comments/test', as: :test
  #post 'blogs/commentcreate'
  resources :comments, only: [:create]
  resources :portals
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
