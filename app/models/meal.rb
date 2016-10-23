class Meal < ApplicationRecord
  belongs_to :user

  validates :name, :image, presence: true

  def self.by_recent
    order(created_at: :desc)
  end
end
