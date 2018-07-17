Rails.application.routes.draw do

  #基本ページ
  get '/help', to: 'static_pages#help'
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  #初期ルート
  root 'static_pages#home'

  #ユーザー新規登録
  get '/signup', to: 'users#new'

  #ログイン、ログアウト機構
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  #userモデルのREST機構
  resources :users
end
