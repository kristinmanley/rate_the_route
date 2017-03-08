class CreateDepartureCities < ActiveRecord::Migration
  def change
    create_table :departure_cities do |t|

      t.timestamps

    end
  end
end
