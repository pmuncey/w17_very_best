class Venue < ApplicationRecord
  # Direct associations

  has_many   :very_best,
             :dependent => :destroy

  # Indirect associations

  has_many   :foods,
             :through => :very_best,
             :source => :food

  # Validations

end
