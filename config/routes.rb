Rails.application.routes.draw do
  get 'shops/index'
  get 'shops/show'
  get 'shops/new'
  get 'shops/edit'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users, only: [:new, :create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
