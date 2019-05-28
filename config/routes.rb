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
  get  '/contact', to: 'contacts#new'
  post '/login',   to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  resources :send_feedbacks, only: [:edit]
  resources :courses do
	resources :votes, only: [:create, :destroy, :update] do
		collection do
			get 'remove_all'
		end
	end
  end
  resources :categories
  resources :locations
  resources :users

  if Rails.env.development?
	get '404', :to => 'application#page_not_found'
	get '422', :to => 'application#server_error'
	get '500', :to => 'application#server_error'
  end

  if Rails.env.production?
   	get '404', :to => 'application#page_not_found'
   	get '422', :to => 'application#server_error'
   	get '500', :to => 'application#server_error'
  end
end
