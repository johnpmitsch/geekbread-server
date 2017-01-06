Devise.setup do |config|  
  config.secret_key = ENV['DEVISE_SECRET_TOKEN']
end
