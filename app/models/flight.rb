class Flight < ApplicationRecord
  # Direct associations

  has_many   :reviews,
             :dependent => :destroy

  belongs_to :destination_city

  belongs_to :departure_city

  belongs_to :airline,
             :class_name => "AirlineCarrier"

  # Indirect associations

  # Validations

end
