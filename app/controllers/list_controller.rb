class ListController < ApplicationController
  def show
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'List'

    @items = current_user.items.order(:purchased, :name)
  end

  def generate
    if current_user.items.destroy_all && ListGenerator.generate(current_user)
      flash[:notice] = 'Successfully generated shopping list'
      redirect_to list_path
    else
      flash[:error] = 'Sorry, something went wrong when generating your list. Error code: 3224'
      redirect_to planner_path
    end
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
