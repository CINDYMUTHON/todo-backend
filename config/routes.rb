Rails.application.routes.draw do
  resources :tasks, only: [:index, :show, :create, :update, :destroy]
  resources :users, only: [:index, :show, :create, :update, :destroy]
  post "/login", to: "users#login"
  get "/users/tasks", to: "users#get_all_user_tasks"
end
