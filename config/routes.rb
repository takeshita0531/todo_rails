Rails.application.routes.draw do
  root to: redirect('/tasks')
  # root to: redirect('/posts')

  resources :tasks, only: [:new, :index, :show, :edit, :create, :update, :destroy]
  resources :modes, only: [:index, :create]

  resources :posts
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
