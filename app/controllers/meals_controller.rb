class MealsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_meal, :verify_user, only: [:show, :edit, :update, :destroy]

  def index
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Meals'

    @meals = current_user.meals.by_recent
  end

  def show
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Meals', meals_path
    add_breadcrumb @meal.name
  end

  def new
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Meals', meals_path
    add_breadcrumb 'New Meal'

    @meal = current_user.meals.new
  end

  def create
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb 'Meals', meals_path
    add_breadcrumb 'New Meal'

    @meal = current_user.meals.create(meal_params)

    if @meal.save
      flash[:notice] = 'Successfully created new meal'
      redirect_to meal_path(@meal)
    else
      flash.now[:alert] = 'Something went wrong!'
      render :new
    end
  end

  def edit
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb @meal.name, meal_path(@meal)
    add_breadcrumb 'Edit Meal'
  end

  def update
    add_breadcrumb 'Dashboard', user_root_path
    add_breadcrumb @meal.name, meal_path(@meal)
    add_breadcrumb 'Edit Meal'

    if @meal.update_attributes(meal_params)
      flash[:notice] = 'Successfully updated meal'
      redirect_to meal_path(@meal)
    else
      render :edit
    end
  end

  def destroy
    name = @meal.name

    if @meal.destroy
      flash[:notice] = "Successfully deleted meal: #{name}"
      redirect_to meals_path
    else
      flash[:alert] = 'Something went wrong!'
      redirect_to meal_path(@meal)
    end
  end

  private

  def verify_user
    unless current_user == @meal.user
      flash[:alert] = 'You do not have permission to access this page'
      redirect_to root_path
    end
  end

  def set_meal
    @meal = Meal.find(params[:id])
  end

  def meal_params
    params.require(:meal).permit(:name, :image, :recipe)
  end
end
