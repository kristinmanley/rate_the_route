class CreateDestinationAirports < ActiveRecord::Migration
  def change
    create_table :destination_airports do |t|

      t.timestamps

    end
  end
end
