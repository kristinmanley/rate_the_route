class CreateDestinationAirports < ActiveRecord::Migration
  def change
    create_table :destination_airports do |t|
      t.string :airport_name
      t.string :destination_city

      t.timestamps

    end
  end
end
