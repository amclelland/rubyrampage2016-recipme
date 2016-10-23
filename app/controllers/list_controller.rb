class ListController < ApplicationController
  def show
  end

  def generate
    ListGenerator.generate(current_user)
  end

  private

  def ingredient_to_item_params(ingredient)
    {
      name: ingredient.name,
      quantity: ingredient.quantity,
      unit: ingredient.unit
    }
  end
end
