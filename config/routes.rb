Rails.application.routes.draw do
  devise_for :users, sign_out_via: [:get, :post]
  resources :users do
    resources :posts
   end

   resources :posts do
    resources :comments
    resources :likes
   end
  
   root 'users#index'
end
