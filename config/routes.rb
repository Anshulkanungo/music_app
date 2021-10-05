Rails.application.routes.draw do
  post '/rate' => 'rater#create', :as => 'rate'
  resources :musics
  root "musics#index"
  #get "organizer",to: "homes#organizer"
  get "listner",to: "listners#listner"
  post "playlists",to: "listners#create"
  get "playlist/new",to: "listners#new"
  post "favorites",to: "listners#fav"
    # devise_for :users, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
    devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }


  #   devise_scope :user do
  #   get '/users/auth/:provider/upgrade' => 'users/omniauth_callbacks#upgrade', as: :user_omniauth_upgrade
  #   get '/users/auth/:provider/setup', :to => 'users/omniauth_callbacks#setup'
  # end

  #devise_for :users, controllers: { omniauth_callbacks_controller: 'devise/omniauth_callbacks_controller' }
  get "abc",to: "musics#abc"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
