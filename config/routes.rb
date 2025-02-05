Rails.application.routes.draw do
  # devise_for :users
  # get "sessions/new"
  # get "users/new"
  # get :login, to: "sessions#new"
  # get :signup, to: "users#new"
  # resources :sessions, only: :create
  # resources :users, only: :create
  # delete "/logout", to: "sessions#destroy", as: :logout
  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout }
  root "tests#index"
 
  resources :answers
  resources :tests do
    resources :questions, shallow: true do
      resources :answers, shallow: true
    end
    member do
      post :start
    end
  end

  namespace :admin do
    resources :tests
  end

  resources :test_passages, only: %i[show update] do
    member do
      get :result
    end
  end
end
# resources :questions, shallow: true, except: :index do
#  resources :answers, shallow: true
