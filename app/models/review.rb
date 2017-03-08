class Review < ApplicationRecord
  # Direct associations

  belongs_to :flight_routes,
             :foreign_key => "flight_route_id"

  # Indirect associations

  # Validations

end
