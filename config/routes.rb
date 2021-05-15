Rails.application.routes.draw do
  # get 'books/new'
  # get 'books/create'
  # get 'books/index'
  # get 'books/show'
  # get 'books/edit'
  # get 'books/destroy'
  # get 'new/create'
  # get 'new/index'
  # get 'new/show'
  # get 'new/edit'
  # get 'new/destroy'
  devise_for :users, controllers: {
    sessions: 'devise/sessions',
    registrations: 'devise/registrations'
  }
  resources :users
  root to: 'homes#top'
  # resources :post_images, only: [:new, :create, :index, :show, :destroy]
  get "home/about" => "homes#about"
  resources :books
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
