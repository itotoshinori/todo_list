Rails.application.routes.draw do
  post 'accounts/itemindex'
  get 'accounts/index'
  post 'accounts/index'
  get 'accounts/new'
  get 'accounts/itemaggregate'
  post '/accounts/create'
  put '/accounts/editmany'
  get 'todos/aggregate'
  get 'accounts/edit'
  post 'todos/createmany'
  #get 'todos/wshow'
  #post 'todos/wshow'
  get 'todos/indexfinished'
  get 'todos/finished'
  post 'todos/finishindex'
  post 'todos/termindex'
  get 'todos/index'
  get 'todos/edit'
  get 'todos/schedule'
  get 'todos/aggregate' 
  
  get 'user/new'
  #get '/user/create'
  post '/user/create'
  get 'login/index'
  post 'login/login'
  get 'login/logout'
  #resources :accounts, only: [:show]
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
