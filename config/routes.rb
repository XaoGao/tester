Rails.application.routes.draw do
  root 'home#welcome'

  namespace :api do
    namespace :v1 do
      post 'login', to: 'session#create'
      delete 'logout', to: 'session#destroy'
    end
  end

  get '*path', to: 'home#welcome', via: :all
end
