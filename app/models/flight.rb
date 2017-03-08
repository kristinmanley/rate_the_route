class Flight < ApplicationRecord
  # Direct associations

  belongs_to :destination_airport,
             :class_name => "DepartureAirport"

  belongs_to :departure_city,
             :class_name => "DestinationAirport"

  has_many   :reviews,
             :dependent => :destroy

  belongs_to :airline,
             :class_name => "AirlineCarrier"

  # Indirect associations

  # Validations

end
