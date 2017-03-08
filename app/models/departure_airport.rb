class DepartureAirport < ApplicationRecord
  # Direct associations

  has_many   :flights,
             :foreign_key => "destination_airport_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
