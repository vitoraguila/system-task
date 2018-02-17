Rails.application.routes.draw do
  get 'subtasks/create'

  get 'subtasks/destroy'

  get 'subtasks/update'

  get 'tasks/show'

  get 'tasks/index'

  get 'tasks/create'

  get 'tasks/update'

  get 'tasks/destroy'

  get 'pages/home'

  devise_for :users, :controllers => { registrations: 'registrations' }
end