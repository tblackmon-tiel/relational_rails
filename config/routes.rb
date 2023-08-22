Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  get "/", to: "welcome#index"

  get "/flocks", to: "flocks#index"
  get "/flocks/:id", to: "flocks#show"
  get "/flocks/:id/birds", to: "flocks#show_birds"

  get "/birds", to: "birds#index"
  get "/birds/:id", to: "birds#show"
end
