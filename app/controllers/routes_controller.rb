class RoutesController < ApplicationController
  def index
    @q = Route.ransack(params[:q])
    @routes = @q.result(:distinct => true).includes(:flight_routes).page(params[:page]).per(10)

    render("routes/index.html.erb")
  end

  def show
    @flight_route = FlightRoute.new
    @route = Route.find(params[:id])

    render("routes/show.html.erb")
  end

  def new
    @route = Route.new

    render("routes/new.html.erb")
  end

  def create
    @route = Route.new

    @route.departure_airport = params[:departure_airport]
    @route.destination_airport = params[:destination_airport]

    save_status = @route.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/routes/new", "/create_route"
        redirect_to("/routes")
      else
        redirect_back(:fallback_location => "/", :notice => "Route created successfully.")
      end
    else
      render("routes/new.html.erb")
    end
  end

  def edit
    @route = Route.find(params[:id])

    render("routes/edit.html.erb")
  end

  def update
    @route = Route.find(params[:id])

    @route.departure_airport = params[:departure_airport]
    @route.destination_airport = params[:destination_airport]

    save_status = @route.save

    if save_status == true
      referer = URI(request.referer).path

      case referer
      when "/routes/#{@route.id}/edit", "/update_route"
        redirect_to("/routes/#{@route.id}", :notice => "Route updated successfully.")
      else
        redirect_back(:fallback_location => "/", :notice => "Route updated successfully.")
      end
    else
      render("routes/edit.html.erb")
    end
  end

  def destroy
    @route = Route.find(params[:id])

    @route.destroy

    if URI(request.referer).path == "/routes/#{@route.id}"
      redirect_to("/", :notice => "Route deleted.")
    else
      redirect_back(:fallback_location => "/", :notice => "Route deleted.")
    end
  end
end
