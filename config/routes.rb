Rails.application.routes.draw do
  # Routes for the Departure_city resource:
  # CREATE
  get "/departure_cities/new", :controller => "departure_cities", :action => "new"
  post "/create_departure_city", :controller => "departure_cities", :action => "create"

  # READ
  get "/departure_cities", :controller => "departure_cities", :action => "index"
  get "/departure_cities/:id", :controller => "departure_cities", :action => "show"

  # UPDATE
  get "/departure_cities/:id/edit", :controller => "departure_cities", :action => "edit"
  post "/update_departure_city/:id", :controller => "departure_cities", :action => "update"

  # DELETE
  get "/delete_departure_city/:id", :controller => "departure_cities", :action => "destroy"
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
