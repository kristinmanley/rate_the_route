Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  root :to => "airline_carriers#index"
  # Routes for the Departure_airport resource:
  # CREATE
  get "/departure_airports/new", :controller => "departure_airports", :action => "new"
  post "/create_departure_airport", :controller => "departure_airports", :action => "create"

  # READ
  get "/departure_airports", :controller => "departure_airports", :action => "index"
  get "/departure_airports/:id", :controller => "departure_airports", :action => "show"

  # UPDATE
  get "/departure_airports/:id/edit", :controller => "departure_airports", :action => "edit"
  post "/update_departure_airport/:id", :controller => "departure_airports", :action => "update"

  # DELETE
  get "/delete_departure_airport/:id", :controller => "departure_airports", :action => "destroy"
  #------------------------------

  # Routes for the Destination_airport resource:
  # CREATE
  get "/destination_airports/new", :controller => "destination_airports", :action => "new"
  post "/create_destination_airport", :controller => "destination_airports", :action => "create"

  # READ
  get "/destination_airports", :controller => "destination_airports", :action => "index"
  get "/destination_airports/:id", :controller => "destination_airports", :action => "show"

  # UPDATE
  get "/destination_airports/:id/edit", :controller => "destination_airports", :action => "edit"
  post "/update_destination_airport/:id", :controller => "destination_airports", :action => "update"

  # DELETE
  get "/delete_destination_airport/:id", :controller => "destination_airports", :action => "destroy"
  #------------------------------

  # Routes for the Flight resource:
  # CREATE
  get "/flights/new", :controller => "flights", :action => "new"
  post "/create_flight", :controller => "flights", :action => "create"

  # READ
  get "/flights", :controller => "flights", :action => "index"
  get "/flights/:id", :controller => "flights", :action => "show"

  # UPDATE
  get "/flights/:id/edit", :controller => "flights", :action => "edit"
  post "/update_flight/:id", :controller => "flights", :action => "update"

  # DELETE
  get "/delete_flight/:id", :controller => "flights", :action => "destroy"
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
