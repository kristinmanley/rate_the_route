class DestinationCitiesController < ApplicationController
  def index
    @destination_cities = DestinationCity.all

    render("destination_cities/index.html.erb")
  end

  def show
    @flight = Flight.new
    @destination_city = DestinationCity.find(params[:id])

    render("destination_cities/show.html.erb")
  end

  def new
    @destination_city = DestinationCity.new

    render("destination_cities/new.html.erb")
  end

  def create
    @destination_city = DestinationCity.new


    save_status = @destination_city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/destination_cities/new", "/create_destination_city"
        redirect_to("/destination_cities")
      else
        redirect_back(:fallback_location => "/", :notice => "Destination city created successfully.")
      end
    else
      render("destination_cities/new.html.erb")
    end
  end

  def edit
    @destination_city = DestinationCity.find(params[:id])

    render("destination_cities/edit.html.erb")
  end

  def update
    @destination_city = DestinationCity.find(params[:id])


    save_status = @destination_city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/destination_cities/#{@destination_city.id}/edit", "/update_destination_city"
        redirect_to("/destination_cities/#{@destination_city.id}", :notice => "Destination city updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Destination city updated successfully.")
      end
    else
      render("destination_cities/edit.html.erb")
    end
  end

  def destroy
    @destination_city = DestinationCity.find(params[:id])

    @destination_city.destroy

    if URI(request.referer).path == "/destination_cities/#{@destination_city.id}"
      redirect_to("/", :notice => "Destination city deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Destination city deleted.")
    end
  end
end
