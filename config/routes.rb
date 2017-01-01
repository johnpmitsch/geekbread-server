Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :v1 do
    resources :ingredients
    resources :recipes do
      resources :ingredients
    end
  end
end
