Rails.application.routes.draw do  
  post 'accounts/itemindex'
  get 'accounts/itemaggregate'
  get 'accounts/itemaggregateyear'
  get 'accounts/monthlychangesaccount'
  put '/accounts/editmany'
  get 'login/new'
  get 'login/index'
  post 'login/login'
  get 'login/logout'
  get 'error_display/index'
  #分類別
  resources :categories, only: [:index]
  get 'categories/index_detail/' , to: 'categories#index_detail'
  #検索条件
  resources :search, only: [:index]
  get 'search/condition'
  post 'search/condition'
  resources :todos
  get 'todos/aggregate' 
  post 'todos/createmany'
  get 'todos/indexfinished'
  get 'todos/finished'
  post 'todos/finishindex'
  post 'todos/termindex'
  resources :schedules, only: [:index]
  resources :accounts, only: [:index,:create]
  resources :comments, only: [:create]
  resources :users
  resource :targets do
    collection do
      get :index
      delete :delete_many 
    end
  end
  resources :user
  resources :portals
  #エクスポート
  get 'toexport/condition'
  post 'toexport/todocsvexport'
  post 'toexport/accountcsvexport'
  #ブログ
  delete 'blog/:id/delete', to: 'blogs#destroy'
  resources :blogs, except: [:delete]
  get '/'=>'portals#index'
  post '/comments/comment_error', as: :comment_error
  get '/comments/test', as: :test
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
