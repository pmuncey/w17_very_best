class Cuisine < ApplicationRecord
  # Direct associations

  has_many   :foods,
             :dependent => :destroy

  # Indirect associations

  # Validations

end
