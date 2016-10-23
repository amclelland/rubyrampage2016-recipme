class PlannedMealsController < ApplicationController
  def new
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Planner', planner_path
    add_breadcrumb 'Add Planned Meal'

    @planned_meal = current_user.planned_meals.new
    @meals = current_user.meals
  end

  def create
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Planner', planner_path
    add_breadcrumb 'Add Planned Meal'

    @planned_meal = current_user.planned_meals.new(planned_meal_params)

    if @planned_meal.save
      flash[:notice] = 'Successfully added planned meal'
      redirect_to planner_path
    else
      @meals = current_user.meals
      render :new
    end
  end

  def destroy
    @planned_meal = PlannedMeal.find(params[:id])
    name = @planned_meal.name

    if @planned_meal.destroy
      flash[:notice] = "Successfully removed planned meal: #{name}"
    else
      flash[:alert] = 'Something went wrong!'
    end

    redirect_to planner_path
  end

  private

  def planned_meal_params
    params.require(:planned_meal).permit(:meal_id)
  end
end
