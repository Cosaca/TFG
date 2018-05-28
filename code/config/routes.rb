Rails.application.routes.draw do
  
  devise_for :teachers, controllers: { registrations: "registrations" }

  resources :courses

  resources :users 

  resources :sections do 
    collection { post :upload }
  end
  
  root 'landing#index'
end
