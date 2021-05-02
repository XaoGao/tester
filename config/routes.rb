Rails.application.routes.draw do
  root 'home#welcome'

  namespace :api do
    namespace :v1 do
      post 'login', to: 'session#create'

      resources :registration, only: %w[create update delete]
    end
  end

  get '*path', to: 'home#welcome', via: :all
end
