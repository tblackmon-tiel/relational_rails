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
  delete "/flocks/:id", to: "flocks#destroy"
  get "/flocks/:id/edit", to: "flocks#edit"

  get "/flocks/:id/birds", to: "flock_birds#index"
  post "flocks/:id/birds", to: "flock_birds#create"
  get "/flocks/:id/birds/new", to: "flock_birds#new"

  get "/birds", to: "birds#index"
  get "/birds/:id", to: "birds#show"
  patch "/birds/:id", to: "birds#update"
  delete "/birds/:id", to: "birds#destroy"
  get "/birds/:id/edit", to: "birds#edit"
end
