Rails.application.routes.draw do
  resources :user_login

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
  end

  root "user_login#index"
end
