Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#index'

  namespace :admin do
    resources :past_events
    resources :speakers
    resources :videos
  end

  post 'contact_us' => 'contact#create'
  get  'meetings' => 'meetings#index'
  get  'past_events' => 'past_events#index'
  get  'twitter/timeline'

  devise_for :admin_users, path: 'admin', path_names: {
    sign_in: 'login',
    sign_out: 'logout'
  }, sign_out_via: %i[delete get]
end
