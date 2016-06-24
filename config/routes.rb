Rails.application.routes.draw do

  resources :playlists
  resources :users
  resources :songs
  resources :artists

  get 'test', to: 'static_pages#test', as: 'test'
  root 'static_pages#home'

end
