Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :v1 do
    resources :ingredients
    resources :recipes do
      resources :ingredients
    end
    resources :users do
      resources :recipes do
        resources :ingredients
      end
    end
    get '/current_user_id', to: 'users#current_user_id'
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
