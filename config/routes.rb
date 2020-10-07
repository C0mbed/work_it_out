Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  root 'users#new'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  post 'login', to: 'sessions#create', as: 'sessions'

  resources :users, only: [:create, :show, :new, :edit, :update] do
    resources :workouts, only: [:show, :index]
  end

  resources :workouts
end
