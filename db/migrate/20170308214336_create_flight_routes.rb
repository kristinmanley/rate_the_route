class CreateFlightRoutes < ActiveRecord::Migration
  def change
    create_table :flight_routes do |t|
      t.integer :route_id
      t.integer :airline_id

      t.timestamps

    end
  end
end
