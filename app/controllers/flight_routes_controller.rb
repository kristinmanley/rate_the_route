class FlightRoutesController < ApplicationController
  def index
    @q = FlightRoute.ransack(params[:q])
    @flight_routes = @q.result(:distinct => true).includes(:airline, :route, :reviews).page(params[:page]).per(10)

    render("flight_routes/index.html.erb")
  end

  def show
    @review = Review.new
    @flight_route = FlightRoute.find(params[:id])

    render("flight_routes/show.html.erb")
  end

  def new
    @flight_route = FlightRoute.new

    render("flight_routes/new.html.erb")
  end

  def create
    @flight_route = FlightRoute.new

    @flight_route.route_id = params[:route_id]
    @flight_route.airline_id = params[:airline_id]

    save_status = @flight_route.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/flight_routes/new", "/create_flight_route"
        redirect_to("/flight_routes")
      else
        redirect_back(:fallback_location => "/", :notice => "Flight route created successfully.")
      end
    else
      render("flight_routes/new.html.erb")
    end
  end

  def edit
    @flight_route = FlightRoute.find(params[:id])

    render("flight_routes/edit.html.erb")
  end

  def update
    @flight_route = FlightRoute.find(params[:id])

    @flight_route.route_id = params[:route_id]
    @flight_route.airline_id = params[:airline_id]

    save_status = @flight_route.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/flight_routes/#{@flight_route.id}/edit", "/update_flight_route"
        redirect_to("/flight_routes/#{@flight_route.id}", :notice => "Flight route updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Flight route updated successfully.")
      end
    else
      render("flight_routes/edit.html.erb")
    end
  end

  def destroy
    @flight_route = FlightRoute.find(params[:id])

    @flight_route.destroy

    if URI(request.referer).path == "/flight_routes/#{@flight_route.id}"
      redirect_to("/", :notice => "Flight route deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Flight route deleted.")
    end
  end
end
