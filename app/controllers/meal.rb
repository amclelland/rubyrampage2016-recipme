class Meal < ApplicationRecord
  belongs_to :user
  has_many :ingredients
  has_many :planned_meals

  validates :name, :image, presence: true

  def self.by_recent
    order(created_at: :desc)
  end
end
