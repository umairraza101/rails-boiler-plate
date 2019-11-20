Rails.application.routes.draw do
  mount Ckeditor::Engine => '/ckeditor'
  root :to => "static#home"
  get 'public_event/:id', to: 'static#show', as: :public_event
  resources :events
  devise_for :users
end
