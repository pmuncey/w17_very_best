class Food < ApplicationRecord
  # Direct associations

  belongs_to :cuisine

  has_many   :foodvenues,
             :class_name => "VeryBest",
             :dependent => :destroy

  # Indirect associations

  # Validations

end
