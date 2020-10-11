Rails.application.routes.draw do
  get 'categories/index'
  get 'categories/index_detail/' , to: 'categories#index_detail'
  post 'accounts/itemindex'
  get 'accounts/index'
  post 'accounts/index'
  get 'accounts/new'
  get 'accounts/itemaggregate'
  get 'accounts/itemaggregateyear'
  post 'accounts/accountcsvexport'
  get 'accounts/monthlychangesaccount'
  post '/accounts/create'
  put '/accounts/editmany'
  get 'todos/aggregate'
  get 'accounts/edit'
  get '/todos/modal'
  post 'todos/createmany'
  get 'todos/search'
  get 'todos/searchresult'
  post 'todos/searchresult'
  post 'todos/research'
  get 'todos/indexfinished'
  get 'todos/finished'
  post 'todos/finishindex'
  post 'todos/termindex'
  get 'todos/index'
  get 'todos/edit'
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
  get 'todos/target_delete_condition'
  resource :targets do
    collection do
      get :index
      delete :delete_many 
    end
  end
  resources :todos
  delete 'blog/:id/delete', to: 'blogs#destroy'
  resources :blogs, except: [:delete]
  #resources :targets, only: [:index,:delete]
  get '/'=>'portals#index'
  
  post '/comments/comment_error', as: :comment_error

  get '/comments/test', as: :test
  resources :comments, only: [:create]
  resources :users
  resources :portals
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
