Rails.application.routes.draw do
  root to: "shelves#index"
  devise_for :users
  resources :shelves 
  resources :books
end
