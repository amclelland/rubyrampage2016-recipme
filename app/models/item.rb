class Item < ApplicationRecord
  belongs_to :user

  validates :name, :quantity, :unit, presence: true
end
