class CreateRoutes < ActiveRecord::Migration
  def change
    create_table :routes do |t|
      t.string :departure_airport
      t.string :destination_airport

      t.timestamps

    end
  end
end
