Rails.application.routes.draw do
  get 'mypages/index'
  get 'sessions/new'

  root 'pages#index'

  resources :users do
    collection do 
      get 'users/auto_complete'
    end
  end
  
  resources :topics do
    post 'add' => 'favorites#create'
    delete '/add' => 'favorites#delete'
    collection do
      get :search
      get 'topics/auto_complete'
    end
    resources :comments, only: [:create,:destroy]
  end

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get 'favorites/index'
  post '/favorites', to: 'favorites#create' 
  post '/favorites/delete', to: 'favorites#delete'

  # post '/comments', to: 'comments#create'
end