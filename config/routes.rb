Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth', controllers: {
    registrations:  'registrations'
    }
  get '/', to: 'ping#health_check'
  get '/ping', to: 'ping#health_check'
  namespace :v1 do
    resources :ingredients
    resources :recipes do
      resources :ingredients
    end
  end
end
