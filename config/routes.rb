Rails.application.routes.draw do
  devise_for :users
  root to: 'home#index'

  get 'login', to: redirect('/auth/google_oauth2'), as: 'login'
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'logout', to: 'sessions#destroy', as: 'logout'

  get 'profile', to: 'profile#show', as: 'profile'
end
