class AirlineCarrier < ApplicationRecord
  # Direct associations

  has_many   :flight_routes,
             :foreign_key => "airline_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
