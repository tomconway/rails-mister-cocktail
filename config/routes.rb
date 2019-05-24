Rails.application.routes.draw do
  root 'cocktails#index'
  # get '/ingredients', to: 'ingredients#index'
  # get '/cocktails', to: 'cocktails#index'
  # get '/cocktails/new', to: 'cocktails#new', as: 'new_cocktail'
  # post '/cocktails', to: 'cocktails#create'
  # get '/cocktails/:id', to: 'cocktails#show', as: 'cocktail'
  resources :cocktails, only: %i[index new show create] do
    resources :doses, only: %i[show create new]
  end
  resources :doses, only: :destroy
end
