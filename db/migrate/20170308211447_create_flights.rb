class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.integer :departure_city_id
      t.integer :destination_airport_id
      t.integer :airline_id

      t.timestamps

    end
  end
end
