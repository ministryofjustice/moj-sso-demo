Rails.application.routes.draw do
  root 'home#logged_out'

  get '/logged_in', to: 'home#logged_in'
  get '/emulate_invalid_auth_token', to: 'home#emulate_invalid_auth_token'

  get '/auth/:provider/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
end
