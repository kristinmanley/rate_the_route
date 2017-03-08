class DestinationAirport < ApplicationRecord
  # Direct associations

  has_many   :flights,
             :foreign_key => "departure_city_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
