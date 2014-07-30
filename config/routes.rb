Rails.application.routes.draw do
  get 'pages/index'
  get 'pages/result'

  post '/search', to: 'pages#search'
  devise_for :users, controllers: { registrations: 'users/registrations' }
  root to: "pages#index"
end
