Rails.application.routes.draw do
  root 'shops#index'
  get '/login', to:'sessions#new'
  post '/login', to:'sessions#create'
  delete '/logout', to:'sessions#destroy'
  resources :users, only: [:new, :create]
  # new/createアクションへのルート設定　
  get '/shops/search', to: 'shops#search'
  # scaffoldにはsearchが含まれていない為、別途定義
  resources :shops
  # index/show/new/create/edit/update/destroyアクションへのルート設定
end
