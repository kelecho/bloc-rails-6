Rails.application.routes.draw do
  
  get 'perfil', to: 'users#edit'
  resources :users, only: [:update]

  devise_for :users
  root to: 'home#index'
  get '/bienvenida', to: 'home#index'
  resources :categories
  resources :articles do
    get '/user/:user_id', to: 'articles#from_author', as: :collection
  end

  # get 'articles', to: 'articles#index'
  # get 'article/new', to: 'articles#new', as: :new_article
  # post 'articles', to: 'articles#create'
  # get 'articles/:id', to: 'articles#show'
  # get 'articles/:id/edit', to: 'articles#edit'
  # patch 'articles/:id', to: 'articles#update', as: :article
  # delete 'articles/:id', to: 'articles#destroy'
end
