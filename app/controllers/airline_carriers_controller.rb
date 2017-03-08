class AirlineCarriersController < ApplicationController
  def index
    @airline_carriers = AirlineCarrier.page(params[:page]).per(10)

    render("airline_carriers/index.html.erb")
  end

  def show
    @flight = Flight.new
    @airline_carrier = AirlineCarrier.find(params[:id])

    render("airline_carriers/show.html.erb")
  end

  def new
    @airline_carrier = AirlineCarrier.new

    render("airline_carriers/new.html.erb")
  end

  def create
    @airline_carrier = AirlineCarrier.new


    save_status = @airline_carrier.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/airline_carriers/new", "/create_airline_carrier"
        redirect_to("/airline_carriers")
      else
        redirect_back(:fallback_location => "/", :notice => "Airline carrier created successfully.")
      end
    else
      render("airline_carriers/new.html.erb")
    end
  end

  def edit
    @airline_carrier = AirlineCarrier.find(params[:id])

    render("airline_carriers/edit.html.erb")
  end

  def update
    @airline_carrier = AirlineCarrier.find(params[:id])


    save_status = @airline_carrier.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/airline_carriers/#{@airline_carrier.id}/edit", "/update_airline_carrier"
        redirect_to("/airline_carriers/#{@airline_carrier.id}", :notice => "Airline carrier updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Airline carrier updated successfully.")
      end
    else
      render("airline_carriers/edit.html.erb")
    end
  end

  def destroy
    @airline_carrier = AirlineCarrier.find(params[:id])

    @airline_carrier.destroy

    if URI(request.referer).path == "/airline_carriers/#{@airline_carrier.id}"
      redirect_to("/", :notice => "Airline carrier deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Airline carrier deleted.")
    end
  end
end
