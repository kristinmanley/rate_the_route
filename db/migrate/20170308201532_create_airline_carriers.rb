class CreateAirlineCarriers < ActiveRecord::Migration
  def change
    create_table :airline_carriers do |t|

      t.timestamps

    end
  end
end
