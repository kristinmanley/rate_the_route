class FlightsController < ApplicationController
  def index
    @flights = Flight.page(params[:page]).per(10)

    render("flights/index.html.erb")
  end

  def show
    @review = Review.new
    @flight = Flight.find(params[:id])

    render("flights/show.html.erb")
  end

  def new
    @flight = Flight.new

    render("flights/new.html.erb")
  end

  def create
    @flight = Flight.new

    @flight.destination_city_id = params[:destination_city_id]
    @flight.departure_city_id = params[:departure_city_id]
    @flight.destination_airport_id = params[:destination_airport_id]
    @flight.departure_airport_id = params[:departure_airport_id]
    @flight.airline_id = params[:airline_id]

    save_status = @flight.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/flights/new", "/create_flight"
        redirect_to("/flights")
      else
        redirect_back(:fallback_location => "/", :notice => "Flight created successfully.")
      end
    else
      render("flights/new.html.erb")
    end
  end

  def edit
    @flight = Flight.find(params[:id])

    render("flights/edit.html.erb")
  end

  def update
    @flight = Flight.find(params[:id])

    @flight.destination_city_id = params[:destination_city_id]
    @flight.departure_city_id = params[:departure_city_id]
    @flight.destination_airport_id = params[:destination_airport_id]
    @flight.departure_airport_id = params[:departure_airport_id]
    @flight.airline_id = params[:airline_id]

    save_status = @flight.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/flights/#{@flight.id}/edit", "/update_flight"
        redirect_to("/flights/#{@flight.id}", :notice => "Flight updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Flight updated successfully.")
      end
    else
      render("flights/edit.html.erb")
    end
  end

  def destroy
    @flight = Flight.find(params[:id])

    @flight.destroy

    if URI(request.referer).path == "/flights/#{@flight.id}"
      redirect_to("/", :notice => "Flight deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Flight deleted.")
    end
  end
end
