class Venue < ApplicationRecord
  # Direct associations

  has_many   :very_best,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
