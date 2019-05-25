Rails.application.routes.draw do
  resources :contacts
  get 'vote/create'
  get 'vote/destroy'
  get 'locations/new'
  get 'courses/new'
  post 'courses/new'
  get 'categories/new'
  get 'sessions/new'
  get 'users/new'
  root 'static_pages#home'
  get  '/help',    to: 'static_pages#help'
  get  '/about',   to: 'static_pages#about'
  get  '/signup',  to: 'users#new'
  get  '/login',   to: 'sessions#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  resources :send_feedbacks, only: [:edit]
  resources :courses do
	resources :votes, only: [:create, :destroy, :update]
  end
  resources :categories
  resources :locations
  resources :users
end
