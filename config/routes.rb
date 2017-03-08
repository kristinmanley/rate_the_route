Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "airline_carriers#index"
  # Routes for the Flight_route resource:
  # CREATE
  get "/flight_routes/new", :controller => "flight_routes", :action => "new"
  post "/create_flight_route", :controller => "flight_routes", :action => "create"

  # READ
  get "/flight_routes", :controller => "flight_routes", :action => "index"
  get "/flight_routes/:id", :controller => "flight_routes", :action => "show"

  # UPDATE
  get "/flight_routes/:id/edit", :controller => "flight_routes", :action => "edit"
  post "/update_flight_route/:id", :controller => "flight_routes", :action => "update"

  # DELETE
  get "/delete_flight_route/:id", :controller => "flight_routes", :action => "destroy"
  #------------------------------

  # Routes for the Route resource:
  # CREATE
  get "/routes/new", :controller => "routes", :action => "new"
  post "/create_route", :controller => "routes", :action => "create"

  # READ
  get "/routes", :controller => "routes", :action => "index"
  get "/routes/:id", :controller => "routes", :action => "show"

  # UPDATE
  get "/routes/:id/edit", :controller => "routes", :action => "edit"
  post "/update_route/:id", :controller => "routes", :action => "update"

  # DELETE
  get "/delete_route/:id", :controller => "routes", :action => "destroy"
  #------------------------------

  devise_for :users
  # Routes for the User resource:
  # READ
  get "/users", :controller => "users", :action => "index"
  get "/users/:id", :controller => "users", :action => "show"


  # Routes for the Review resource:
  # CREATE
  get "/reviews/new", :controller => "reviews", :action => "new"
  post "/create_review", :controller => "reviews", :action => "create"

  # READ
  get "/reviews", :controller => "reviews", :action => "index"
  get "/reviews/:id", :controller => "reviews", :action => "show"

  # UPDATE
  get "/reviews/:id/edit", :controller => "reviews", :action => "edit"
  post "/update_review/:id", :controller => "reviews", :action => "update"

  # DELETE
  get "/delete_review/:id", :controller => "reviews", :action => "destroy"
  #------------------------------

  # Routes for the Airline_carrier resource:
  # CREATE
  get "/airline_carriers/new", :controller => "airline_carriers", :action => "new"
  post "/create_airline_carrier", :controller => "airline_carriers", :action => "create"

  # READ
  get "/airline_carriers", :controller => "airline_carriers", :action => "index"
  get "/airline_carriers/:id", :controller => "airline_carriers", :action => "show"

  # UPDATE
  get "/airline_carriers/:id/edit", :controller => "airline_carriers", :action => "edit"
  post "/update_airline_carrier/:id", :controller => "airline_carriers", :action => "update"

  # DELETE
  get "/delete_airline_carrier/:id", :controller => "airline_carriers", :action => "destroy"
  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
