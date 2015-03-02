Rails.application.routes.draw do

  resources :users

  resources :github_auth do
    collection do
      get :callback
      get :authorized
    end
  end  
	
  root 'pages#home'
end
