Rails.application.routes.draw do
  resources :attributes
  resources :types
  root 'pages#home'
  devise_for :users

end
