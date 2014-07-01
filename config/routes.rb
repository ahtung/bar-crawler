Rails.application.routes.draw do
  get 'pages/search'

  devise_for :users
  root to: "pages#search"
end
