Rails.application.routes.draw do
  
  resources :excursions
  devise_for :users
  get 'pages/index'

  root 'pages#index'

end
