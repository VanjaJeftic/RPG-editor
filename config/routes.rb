Rails.application.routes.draw do
  resources :types do
    resources :attributes
  end
  root 'pages#home'
  devise_for :users
end