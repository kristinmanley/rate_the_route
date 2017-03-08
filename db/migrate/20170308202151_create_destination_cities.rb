class CreateDestinationCities < ActiveRecord::Migration
  def change
    create_table :destination_cities do |t|

      t.timestamps

    end
  end
end
