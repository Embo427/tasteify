Rails.application.routes.draw do
  root 'static_pages#home'
  get 'test', to: 'static_pages#test', as: 'test'
end
