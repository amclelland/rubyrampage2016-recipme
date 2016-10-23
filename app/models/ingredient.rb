class Ingredient < ApplicationRecord
  belongs_to :meal

  validates :name, :quantity, :unit, presence: true
end
