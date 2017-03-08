class DepartureCitiesController < ApplicationController
  def index
    @departure_cities = DepartureCity.all

    render("departure_cities/index.html.erb")
  end

  def show
    @flight = Flight.new
    @departure_city = DepartureCity.find(params[:id])

    render("departure_cities/show.html.erb")
  end

  def new
    @departure_city = DepartureCity.new

    render("departure_cities/new.html.erb")
  end

  def create
    @departure_city = DepartureCity.new


    save_status = @departure_city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/departure_cities/new", "/create_departure_city"
        redirect_to("/departure_cities")
      else
        redirect_back(:fallback_location => "/", :notice => "Departure city created successfully.")
      end
    else
      render("departure_cities/new.html.erb")
    end
  end

  def edit
    @departure_city = DepartureCity.find(params[:id])

    render("departure_cities/edit.html.erb")
  end

  def update
    @departure_city = DepartureCity.find(params[:id])


    save_status = @departure_city.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/departure_cities/#{@departure_city.id}/edit", "/update_departure_city"
        redirect_to("/departure_cities/#{@departure_city.id}", :notice => "Departure city updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Departure city updated successfully.")
      end
    else
      render("departure_cities/edit.html.erb")
    end
  end

  def destroy
    @departure_city = DepartureCity.find(params[:id])

    @departure_city.destroy

    if URI(request.referer).path == "/departure_cities/#{@departure_city.id}"
      redirect_to("/", :notice => "Departure city deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Departure city deleted.")
    end
  end
end
