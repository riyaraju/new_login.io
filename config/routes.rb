Rails.application.routes.draw do

  devise_for :users

  resources :user_profiles, except: [:show]

  get 'user_profiles/list'
  get '/user_profiles/:id', to: 'user_profiles#index', as: 'user_view'

  root 'user_profiles#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
