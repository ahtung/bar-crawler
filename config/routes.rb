Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/result'

  post '/search', to: 'pages#search'
  devise_for :users
  root to: "pages#index"
end
