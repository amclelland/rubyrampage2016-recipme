class UpdateMeals < ActiveRecord::Migration[5.0]
  def change
    add_column :meals, :image, :string
    add_column :meals, :recipe, :string
    add_reference :meals, :user, index: true
  end
end
