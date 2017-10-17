Cincirb::Application.routes.draw do
  get "twitter/timeline"

  ActiveAdmin.routes(self)

  devise_for :admin_users, ActiveAdmin::Devise.config

  root :to => 'pages#index'
  get 'meetings' => 'meetings#index'
  post 'contact_us' => 'contact#create'
  resources :past_events
end
