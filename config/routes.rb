Rails.application.routes.draw do
  root to: "shelves#index"
  devise_for :users
  resources :shelves do
  	resources :books
  end
  resources :books
end
