class DestinationCity < ApplicationRecord
  # Direct associations

  has_many   :flights,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
