class CreateDepartureAirports < ActiveRecord::Migration
  def change
    create_table :departure_airports do |t|

      t.timestamps

    end
  end
end
