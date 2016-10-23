class EditItem < ActiveRecord::Migration[5.0]
  def change
    remove_column :items, :unit
    remove_column :items, :quantity
    add_column :items, :amount, :string
  end
end
