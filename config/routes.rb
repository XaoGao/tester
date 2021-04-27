Rails.application.routes.draw do
  root 'home#welcome'
  get '*path', to: 'home#welcome', via: :all
end
