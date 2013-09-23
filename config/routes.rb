Rails::Application.routes.draw do
  get "home/index"

  resources :spellings
  root :to => "home#index"
end
