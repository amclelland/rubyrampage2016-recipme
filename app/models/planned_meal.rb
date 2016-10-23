class PlannedMeal < ApplicationRecord
  belongs_to :user
  belongs_to :meal

  validates :meal_id, presence: true

  delegate :name, :image, to: :meal

  def self.by_recent
    order(created_at: :desc)
  end

  def self.by_name
    order('meals.name')
  end
end
