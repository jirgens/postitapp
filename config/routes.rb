PostitTemplate::Application.routes.draw do
  root to: 'posts#index'

  get '/login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get '/logout', to: 'session#new'
  
  resources :posts, except: [:destroy] do
		resources :comments, only: [:create]
	end
	resources :categories, only: [:new, :create, :show]

end