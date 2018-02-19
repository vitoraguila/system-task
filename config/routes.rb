Rails.application.routes.draw do
  devise_for :users, :controllers => { registrations: 'registrations' }
  
  root to: 'pages#home'
  resources :tasks do
    collection do
      get :recent
      get :mytasks
      get :alltasks
    end
  end

  match 'tasks/:id/status', :to => 'tasks#status', :as => 'task_status', :via => :post
  match 'subtasks/:id/status', :to => 'subtasks#status', :as => 'subtask_status', :via => :post

  resources :subtasks, only: [:create, :destroy, :update]
end