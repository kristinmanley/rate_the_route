class Flight < ApplicationRecord
  # Direct associations

  belongs_to :departure_airport

  belongs_to :destination_airport

  has_many   :reviews,
             :dependent => :destroy

  belongs_to :destination_city

  belongs_to :departure_city

  belongs_to :airline,
             :class_name => "AirlineCarrier"

  # Indirect associations

  # Validations

end
