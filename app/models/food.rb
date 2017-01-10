class Food < ApplicationRecord
  # Direct associations

  has_many   :foodvenues,
             :class_name => "VeryBest",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
