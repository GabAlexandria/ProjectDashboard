Rails.application.routes.draw do

  resources :projects

  devise_for :users
  resources :users

  resources :github_auth do
    collection do
      get :callback
      get :authorized
    end
  end  

  resources :bitbucket_auth do
    collection do
      get :callback
      get :authorized
    end
  end

  namespace :user do
    resources :projects do
      collection do
        post :repositories
      end
    end
  end

  root 'pages#home'
end
