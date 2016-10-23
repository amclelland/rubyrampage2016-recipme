class PlannerController < ApplicationController
  def show
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Planner'

    @planned_meals = current_user.planned_meals.includes(:meal).by_name
  end

  def new
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Planner', planner_path
    add_breadcrumb 'Add Planned Meal'
  end
end
