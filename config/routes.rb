Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/index_detail/' , to: 'categories#index_detail'
  post 'accounts/itemindex'
  #get 'accounts/index'
  #post '/accounts/create'
  #post 'accounts/index'
  #get 'accounts/new'
  get 'accounts/itemaggregate'
  get 'accounts/itemaggregateyear'
  post 'accounts/accountcsvexport'
  get 'accounts/monthlychangesaccount'
  put '/accounts/editmany'
  get 'todos/aggregate'
  get 'accounts/edit'
  post 'todos/createmany'
  get 'todos/search'
  get 'todos/searchresult'
  post 'todos/searchresult'
  post 'todos/research'
  get 'todos/indexfinished'
  get 'todos/finished'
  post 'todos/finishindex'
  post 'todos/termindex'
  get 'todos/schedule'
  get 'todos/aggregate' 
  get 'todos/toexport'
  post 'todos/todocsvexport'
  get 'todos/research'
  get 'user/index'
  get 'user/new'
  get 'user/edit'
  post 'user/update'
  post '/user/create' 
  get 'login/new'
  get 'login/index'
  post 'login/login'
  get 'login/logout'
  get 'error_display/index'
  resource :targets do
    collection do
      get :index
      delete :delete_many 
    end
  end
  resources :schedules, only: [:index]
  resources :accounts, only: [:index,:create]
  resources :todos
  resources :comments, only: [:create]
  resources :users
  resources :user
  resources :portals
  delete 'blog/:id/delete', to: 'blogs#destroy'
  resources :blogs, except: [:delete]
  get '/'=>'portals#index'
  post '/comments/comment_error', as: :comment_error
  get '/comments/test', as: :test
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
