Rails.application.routes.draw do
  get "up" => "rails/health#show", as: :rails_health_check

  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  root "home#index"

  get "/about" => "home#about"

  post "/users/exists" => "login_modal#check_user_exists"

  patch '/users/:id/update_password' => 'passwords#update', as: 'users_update_password'
  patch '/users/:id/update_profile' => 'profiles#update', as: 'users_update_profile'

  resources :blogs do
    resources :posts
  end

  post '/blogs/:blog_id/add_coauthor/:id' => 'blogs#add_new_coauthor', as: "blog_add_coauthor"

  get '/search/results' => 'search#index'
  get '/search' => 'search#search'

  resources :dashboard, only: [:index] do
    collection do
      get :my_blogs
      get :profile
      get :password
    end
  end

  resources :profiles

  post '/profiles/search' => 'profiles#search'
end
