Movietime::Application.routes.draw do
  resources :people


  resources :genres


  resources :sources


  resources :movies


  authenticated :user do
    root :to => 'home#index'
  end
  root :to => "home#index"
  devise_for :users
  resources :users
end