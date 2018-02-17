Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }

  root to: 'pages#home'
  resources :tasks, only: [:index, :create, :destroy, :update]
  resources :subtasks, only: [:create, :destroy, :update]
end