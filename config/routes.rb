Rails.application.routes.draw do
  get 'accounts/index'
  get 'accounts/new'

  post '/accounts/create'
  put '/accounts/editmany'

  get 'accounts/edit'
  post 'todos/createmany'
  get 'todos/wshow'
  post 'todos/wshow'
  get 'todos/indexfinished'
  get 'todos/finished'
  get 'todos/index'
  get 'todos/edit'
  get 'todos/schedule'
  
  get 'user/new'
  #get '/user/create'
  post '/user/create'
  get 'login/index'
  post 'login/login'
  get 'login/logout'
  resources :todos
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
