class Meal < ApplicationRecord
  belongs_to :user
  has_many :ingredients, dependent: :destroy

  validates :name, presence: true

  def self.by_recent
    order(created_at: :desc)
  end
end
