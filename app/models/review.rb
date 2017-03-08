class Review < ApplicationRecord
  # Direct associations

  belongs_to :flight_routes,
             :foreign_key => "flight_route_id"

  belongs_to :user

  # Indirect associations

  # Validations

end
