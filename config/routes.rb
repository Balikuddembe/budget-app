Rails.application.routes.draw do
  devise_for :users

  devise_scope :user do
    authenticated :user do
      root 'groups#index', as: :authenticated_root
    end
    
    unauthenticated do
      root 'splash#index', as: :unauthenticated_root
    end
  end  

  resources :groups, only: [:index, :new, :create, :show, :destroy] do
    resources :expenses, only: [:index, :new, :create, :show, :destroy]
  end

  root "splash#index"
end