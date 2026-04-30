Rails.application.routes.draw do
  resource :sessions
  resources :passwords, param: :token

  # Till routes
  namespace :till_ui do
    resources :start
    resources :sales, only: [:show] do
      resources :sale_items, only: [:create, :destroy]
      resources :payments, only: [:new, :create]
      member do
        get :complete
      end
    end

    root "start#index"
  end

  # Admin routes
  namespace :admin do
    resources :items
    resources :sales, only: [ :index, :show ]

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
