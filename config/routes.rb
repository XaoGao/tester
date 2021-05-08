Rails.application.routes.draw do
  root 'home#welcome'

  namespace :api do
    namespace :v1 do
      post 'login', to: 'session#create'

      resources :registration, only: %w[create update destroy]
      resources :positions, only: %w[index create update destroy]
      resources :departments, only: %w[index create update destroy]
      resources :phones, only: %w[index create update destroy]
      resources :phonebooks, only: %w[index]
    end
  end

  get '*path', to: 'home#welcome', via: :all
end
