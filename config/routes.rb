Rails.application.routes.draw do
  get "registrations/new"
  get "registrations/Create"
  resource :home

  resource :sessions
  resources :passwords, param: :token

  get  '/signup', to: 'registrations#new'
  post '/signup', to: 'registrations#create', as: :registration

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
rails generate controller Registrations new create
  root "home#index"
end
