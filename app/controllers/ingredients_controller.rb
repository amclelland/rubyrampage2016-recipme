class IngredientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meal
  before_action :set_ingredient, only: [:edit, :update, :destroy]

  def new
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Meals', meals_path
    add_breadcrumb @meal.name, meal_path(@meal)
    add_breadcrumb 'New Ingredient'

    @ingredient = @meal.ingredients.new
    @units = YAML.load_file("#{Rails.root}/config/units.yml")
  end

  def create
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Meals', meals_path
    add_breadcrumb @meal.name, meal_path(@meal)
    add_breadcrumb 'New Ingredient'

    @ingredient = @meal.ingredients.create(ingredient_params)

    if @ingredient.save
      flash[:notice] = 'Successfully created new ingredient'
      redirect_to meal_path(@meal)
    else
      render :new
    end
  end

  def edit
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Meals', meals_path
    add_breadcrumb @meal.name, meal_path(@meal)
    add_breadcrumb "Edit #{@ingredient.name}"
  end

  def update
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Meals', meals_path
    add_breadcrumb @meal.name, meal_path(@meal)
    add_breadcrumb "Edit #{@ingredient.name}"

    if @ingredient.update_attributes(ingredient_params)
      flash[:notice] = 'Successfully updated ingredient'
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end

  def destroy
    name = @ingredient.name

    if @ingredient.destroy
      flash[:notice] = "Successfully deleted ingredient: #{name}"
    else
      flash[:alert] = 'Something went wrong!'
    end

    redirect_to meal_path(@meal)
  end

  private

  def ingredient_params
    params.require(:ingredient).permit(:name, :quantity, :unit)
  end

  def set_meal
    @meal = Meal.find(params[:meal_id])
  end

  def set_ingredient
    @ingredient = Ingredient.find(params[:id])
  end
end
