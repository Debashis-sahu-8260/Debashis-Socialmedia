Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  resources :socials
  root "socials#index"
end
