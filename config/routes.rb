Rails.application.routes.draw do
  devise_for :users
  root to: 'devise#users/sign_up'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
