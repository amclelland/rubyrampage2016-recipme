module Api
  class MealsController < BaseController
    def index
      respond_with Meal.all
    end

    def create
      respond_with :api, Meal.create(meal_params)
    end

    def destroy
      respond_with Meal.destroy(params[:id])
    end

    def update
      meal = Meal.find(params["id"])
      meal.update_attributes(meal_params)
      respond_with meal, json: meal
    end

    private

    def meal_params
      params.require(:meal).permit(:id, :name)
    end
  end
end
