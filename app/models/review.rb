class Review < ApplicationRecord
  # Direct associations

  belongs_to :flight

  belongs_to :user

  # Indirect associations

  # Validations

end
