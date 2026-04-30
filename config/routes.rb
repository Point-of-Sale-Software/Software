Rails.application.routes.draw do
  resource :sessions
  resources :passwords, param: :token

  # Admin routes
  namespace :admin do
    resources :items

    resources :tills do
      resources :till_sessions do
        member do
          patch :close
        end
      end
    end

    root "home#index"
  end

  root "home#index"
end
