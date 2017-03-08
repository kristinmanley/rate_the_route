class DepartureAirportsController < ApplicationController
  def index
    @q = DepartureAirport.ransack(params[:q])
    @departure_airports = @q.result(:distinct => true).includes(:flights).page(params[:page]).per(10)

    render("departure_airports/index.html.erb")
  end

  def show
    @flight = Flight.new
    @departure_airport = DepartureAirport.find(params[:id])

    render("departure_airports/show.html.erb")
  end

  def new
    @departure_airport = DepartureAirport.new

    render("departure_airports/new.html.erb")
  end

  def create
    @departure_airport = DepartureAirport.new


    save_status = @departure_airport.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/departure_airports/new", "/create_departure_airport"
        redirect_to("/departure_airports")
      else
        redirect_back(:fallback_location => "/", :notice => "Departure airport created successfully.")
      end
    else
      render("departure_airports/new.html.erb")
    end
  end

  def edit
    @departure_airport = DepartureAirport.find(params[:id])

    render("departure_airports/edit.html.erb")
  end

  def update
    @departure_airport = DepartureAirport.find(params[:id])


    save_status = @departure_airport.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/departure_airports/#{@departure_airport.id}/edit", "/update_departure_airport"
        redirect_to("/departure_airports/#{@departure_airport.id}", :notice => "Departure airport updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Departure airport updated successfully.")
      end
    else
      render("departure_airports/edit.html.erb")
    end
  end

  def destroy
    @departure_airport = DepartureAirport.find(params[:id])

    @departure_airport.destroy

    if URI(request.referer).path == "/departure_airports/#{@departure_airport.id}"
      redirect_to("/", :notice => "Departure airport deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Departure airport deleted.")
    end
  end
end
