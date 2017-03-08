class DestinationAirportsController < ApplicationController
  def index
    @destination_airports = DestinationAirport.all

    render("destination_airports/index.html.erb")
  end

  def show
    @flight = Flight.new
    @destination_airport = DestinationAirport.find(params[:id])

    render("destination_airports/show.html.erb")
  end

  def new
    @destination_airport = DestinationAirport.new

    render("destination_airports/new.html.erb")
  end

  def create
    @destination_airport = DestinationAirport.new


    save_status = @destination_airport.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/destination_airports/new", "/create_destination_airport"
        redirect_to("/destination_airports")
      else
        redirect_back(:fallback_location => "/", :notice => "Destination airport created successfully.")
      end
    else
      render("destination_airports/new.html.erb")
    end
  end

  def edit
    @destination_airport = DestinationAirport.find(params[:id])

    render("destination_airports/edit.html.erb")
  end

  def update
    @destination_airport = DestinationAirport.find(params[:id])


    save_status = @destination_airport.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/destination_airports/#{@destination_airport.id}/edit", "/update_destination_airport"
        redirect_to("/destination_airports/#{@destination_airport.id}", :notice => "Destination airport updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Destination airport updated successfully.")
      end
    else
      render("destination_airports/edit.html.erb")
    end
  end

  def destroy
    @destination_airport = DestinationAirport.find(params[:id])

    @destination_airport.destroy

    if URI(request.referer).path == "/destination_airports/#{@destination_airport.id}"
      redirect_to("/", :notice => "Destination airport deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Destination airport deleted.")
    end
  end
end
