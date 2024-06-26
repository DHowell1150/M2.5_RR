Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/gyms", to: "gyms#index"
  get "/gyms/new", to: "gyms#new"
  get "/gyms/:id", to: "gyms#show"
  get "/gyms/:id/edit", to: "gyms#edit"
  post "/gyms", to: "gyms#create"


  get "/gyms/:id/athletes", to: "gym_athletes#index"
  get "/gyms/:id/athletes/edit", to: "gym_athletes#edit"
  get "/gyms/:id/athletes/new", to: "gym_athletes#new"
  post "/gyms/:id/athletes", to: "gym_athletes#create"


  get "/athletes", to: "athletes#index"
  get "/athletes/:id", to: "athletes#show"
  get "/athletes/:id/edit", to: "athletes#edit"

  # Defines the root path route ("/")
  # root "posts#index"
end
