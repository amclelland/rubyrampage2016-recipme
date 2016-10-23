class ListGenerator
  attr_reader :user

  def self.generate(user)
    new(user).generate
  end

  def initialize(user)
    @user = user
  end

  def generate
    # planned_meals.each do |meal|
    #   meal.ingredients.each do |ingredient|
    #     item = find_matching_item(ingredient)
    #
  	# 		if item.present?
    #       if item.unit == ingredient.unit
    # 				item.quantity += ingredient.quantity
    # 				item.save!
    #       else
    #
    #       end
  	# 		else
  	# 			current_user.items.create(ingredient_to_item_params(ingredient))
  	# 		end
  	# 	end
    # end

    uniq_names.each do |name|
      ingredients_with_name = ingredients.select { |ingredient| ingredient.name.downcase == name }

      binding.pry
    end
  end

  private

  def uniq_names
    downcased_names.uniq
  end

  def downcased_names
    ingredients.map { |i| i.name.downcase }
  end

  def ingredients
    @ingredients ||= planned_meals.map(&:meal).flat_map(&:ingredients)
  end

  def planned_meals
    @planned_meals ||= user.planned_meals.includes(:ingredients)
  end

  def find_matching_item(ingredient)
		user.items.each do |item|
			if item.name.downcase == ingredient.name.downcase
				return item
			end
		end

		return nil
	end
end
