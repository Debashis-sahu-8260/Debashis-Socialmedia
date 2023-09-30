Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users' }
  resources :socials
  root "socials#index"
  resources :likes
  resources :socials do
    resources :likes, only: [:create, :destroy]
  end
  resources :socials do
    resources :comments, only: [:create, :destroy]
  end
  
  
end
