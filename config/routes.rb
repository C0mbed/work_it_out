Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get '/auth/facebook/callback' => 'sessions#create_facebook'
  post 'login', to: 'sessions#create', as: 'sessions'
  post 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users, only: [:create, :show, :new, :edit, :update] do
    resources :workouts, only: [:show, :index, :new]
  end

  resources :workouts, only: [:index, :show]

  resources :exercises do
    resources :repetitions
  end
end
