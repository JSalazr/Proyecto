Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'home#index'

  get "/campaigns/dashboard", to: "campaigns#dashboard", as: "dashboard"

    resources :campaigns do
      resources :comments
      resources :donations
    end

  get "/:category/campaigns" => "campaigns#category", as: "category"

  get "/join" => "users#new", as: "signup"
  get "/login" => "sessions#new", as: "login"
  post "/login" => "sessions#create"
  delete "/logout" => "sessions#destroy"

  get "/profile" => "sessions#show", as: "profile"
  get "/profile/edit" => "users#edit", as: "edit_profile"
  get "/profile/password" => "users#password", as: "password_profile"

  get '/contact' => 'contact_us/contacts#new'
  get '/contact/thanks' => 'contact_us/contacts#thanks'

  resources :users

end
