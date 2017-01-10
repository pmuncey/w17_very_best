class VeryBest < ApplicationRecord
  # Direct associations

  belongs_to :user

  belongs_to :venue

  belongs_to :food

  # Indirect associations

  # Validations

end
