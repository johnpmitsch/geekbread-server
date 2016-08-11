Rails.application.routes.draw do
   constraints subdomain: 'api' do
    scope module: 'api' do
      namespace :v1 do
        resources :ingredients
        resources :recipes
        resources :users
      end
    end
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  # Serve websocket cable requests in-process
  # mount ActionCable.server => '/cable'
end
