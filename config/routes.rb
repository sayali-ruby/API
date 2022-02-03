Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
     resources :users
     resources :profiles
     
      namespace :v1 do
        resources :users #except: [:new, :edit]
      end
  
      namespace :v1 do
        resources :profiles #only: [:show]
      end
end
