Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }
  resources :users
  root to: 'homes#top'
  # resources :post_images, only: [:new, :create, :index, :show, :destroy]
  get "home/about" => "homes#about"
  resources :books
  resources :users, only: [:show, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
