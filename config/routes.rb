Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"

  get "/flocks", to: "flocks#index"
  post "/flocks", to: "flocks#create"
  get "/flocks/new", to: "flocks#new"
  get "/flocks/:id", to: "flocks#show"
  patch "/flocks/:id", to: "flocks#update"
  get "/flocks/:id/edit", to: "flocks#edit"
  get "/flocks/:id/birds", to: "flock_birds#index"

  get "/birds", to: "birds#index"
  get "/birds/:id", to: "birds#show"
end
