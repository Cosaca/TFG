Rails.application.routes.draw do
  
  devise_for :teachers, controllers: { registrations: "registrations" }

  resources :courses
  
  root 'landing#index'
end
