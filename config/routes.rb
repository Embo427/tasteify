Rails.application.routes.draw do

  resources :artists

  root 'static_pages#home'
  get 'test', to: 'static_pages#test', as: 'test'
end
