Rails.application.routes.draw do
  devise_for :logins
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  resources :users do
    resources :posts
   end

   root 'users#index'
   get 'posts/index'
   get 'posts/show'
   get 'posts/new'
end
