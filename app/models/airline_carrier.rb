class AirlineCarrier < ApplicationRecord
  # Direct associations

  has_many   :flights,
             :foreign_key => "airline_id",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
