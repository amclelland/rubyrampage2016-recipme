class Ingredient < ApplicationRecord
  belongs_to :meal

  validates :name, :quantity, :unit, presence: true

  def to_s
    "#{quantity} #{raw_unit}"
  end

  private

  def raw_unit
    unit.split('(').first
  end
end
