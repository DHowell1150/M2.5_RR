Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  get "/gyms", to: "gyms#index"
  get "/gyms/new", to: "gyms#new"
  get "/gyms/:id", to: "gyms#show"
  post "/gyms", to: "gyms#create"


  get "/gyms/:id/gym_athletes", to: "gym_athletes#index"


  get "/athletes", to: "athletes#index"
  get "/athletes/:id", to: "athletes#show"

  # get "/gyms/:gym_id/athletes", to: "gym_athletes#index", as: "gym_athletes"
  get "/gyms/:gym_id/gym_athletes", to: "gym_athletes#index"
  # Defines the root path route ("/")
  # root "posts#index"
end
