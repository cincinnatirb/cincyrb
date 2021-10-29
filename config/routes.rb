Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  ActiveAdmin.routes(self)

  resources :pages, only: [:index, :new, :create]
 
  get  'meetings' => 'meetings#index'
  get  'twitter/timeline'

  resources :past_events

  devise_for :admin_users, ActiveAdmin::Devise.config
end
