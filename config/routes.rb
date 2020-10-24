Rails.application.routes.draw do
  root 'pages#index'

  ActiveAdmin.routes(self)

  post 'contact_us' => 'contact#create'
  get  'meetings' => 'meetings#index'
  get  'twitter/timeline'

  resources :past_events

  devise_for :admin_users, ActiveAdmin::Devise.config
end
