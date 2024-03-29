class CreateIngredients < ActiveRecord::Migration[5.0]
  def change
    create_table :ingredients do |t|
      t.belongs_to :meal, index: true
      t.string :name
      t.decimal :quantity
      t.string :unit

      t.timestamps
    end
  end
end
