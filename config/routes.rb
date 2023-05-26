Rails.application.routes.draw do
  root to: 'lists#index'

  resources :movies, only: %i[index show]

  resources :lists, only: %i[index show new create] do
    resources :bookmarks, only: %i[new create]
  end

  resources :bookmarks, only: %i[destroy]
end
