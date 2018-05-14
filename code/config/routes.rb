Rails.application.routes.draw do
  
  devise_for :teachers, path_names: { sign_in: 'login', sign_out: 'logout', password: 'secret', confirmation: 'verification', unlock: 'unblock', sign_up: 'sign_up' }

  devise_scope :teacher do
    get 'login', to: 'devise/sessions#new'
  end

  devise_scope :user do
    get 'sign_up', to: 'devise/registrations#new'
  end
  
  resources :courses
  
  root 'landing#index'
end
