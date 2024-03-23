US10.  I tracked it all down!  I had a route error 
  `get "/gyms/:id/athletes", to: "athletes#show"`
  `get "/gyms/:id/athletes", to: "athletes#index"`
  `get "/gyms/:id/gym_athletes", to: "gym_athletes#index"`

1. no route error so I fixed all of the above in succession.
- Normally I would have asked for help but I tracked it down and did it on my own.  
- had to look at specs, controllers, routes and views.  So proud of myself on this one.  