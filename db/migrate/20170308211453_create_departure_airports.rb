class CreateDepartureAirports < ActiveRecord::Migration
  def change
    create_table :departure_airports do |t|
      t.string :airport_name
      t.string :departure_city

      t.timestamps

    end
  end
end
