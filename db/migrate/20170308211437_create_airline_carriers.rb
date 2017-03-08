class CreateAirlineCarriers < ActiveRecord::Migration
  def change
    create_table :airline_carriers do |t|
      t.string :airline_name

      t.timestamps

    end
  end
end
