Rails.application.routes.draw do
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
