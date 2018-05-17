Rails.application.routes.draw do
  
  devise_for :teachers, controllers: { registrations: "registrations" }

  resources :courses

  resources :users
  
  root 'landing#index'
end
