class Flight < ApplicationRecord
  # Direct associations

  belongs_to :airline,
             :class_name => "AirlineCarrier"

  # Indirect associations

  # Validations

end
