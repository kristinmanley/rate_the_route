class Route < ApplicationRecord
  # Direct associations

  has_many   :flight_routes,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
