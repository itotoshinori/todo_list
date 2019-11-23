Rails.application.routes.draw do
  get 'portals/index'

  get 'portals/new'

  get '/'=>'portals#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
