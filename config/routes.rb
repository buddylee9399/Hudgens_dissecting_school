Rails.application.routes.draw do
  resources :guides
  resources :topics
  resources :followings, only: [:create, :destroy]
  get :search_query, to: 'search#search_query', as: :search_query  
  devise_for :users
  get 'profile/:id', to: 'profiles#show', as: :profile
  get :profiles, to: 'profiles#index', as: :profiles  
  root to: 'static_pages#index'
  
  get   'about', to: 'static_pages#about'
  get   'contact', to: 'static_pages#contact'
  get   'privacy', to: 'static_pages#privacy'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
