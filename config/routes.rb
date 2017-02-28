Rails.application.routes.draw do
  devise_for :users
  #limit routes to only these 4
  resources :messages, :only => [:index, :new, :create, :show]
  resources :users, :only => [:show]

  root :to => 'home#index'
end
