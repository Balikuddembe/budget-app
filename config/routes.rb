Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # case where user is a guest(not logged in)

  # Defines the root path route ("/")
  # root "articles#index"
end
