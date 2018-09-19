Rails.application.routes.draw do
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users, only: [:new, :create]
  # new/createアクションへのルート設定　
  resources :shops
  # index/show/new/create/edit/update/destroyアクションへのルート設定
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
