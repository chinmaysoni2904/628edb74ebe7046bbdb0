Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    resources :users do

    end
  end
  get "api/user/:id" => "api/users#show"
  post "api/user" => "api/users#create"
  put "api/user/:id" => "api/users#update"
  delete "api/user/:id" => "api/users#destroy"
  get "api/typeahead/:input" => "api/users#search"
end
