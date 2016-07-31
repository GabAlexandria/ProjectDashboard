Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  devise_for :users
  resources :users

  resources :projects

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
