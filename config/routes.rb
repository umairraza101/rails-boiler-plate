Rails.application.routes.draw do
  root :to => "static#home"
  resources :events
  devise_for :users
end
