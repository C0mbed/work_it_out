Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get '/auth/facebook/callback', to: 'sessions#create_facebook'
  post 'login', to: 'sessions#create', as: 'sessions'
  delete 'logout', to: 'sessions#destroy', as: 'logout'
  post 'repetitions', to: 'repetitions#create', as: 'repetitions'

  resources :users do
    resources :workouts, only: [:new, :create]
  end

  resources :workouts do
    resources :exercises do
      resources :repetitions
    end
  end
 
end
