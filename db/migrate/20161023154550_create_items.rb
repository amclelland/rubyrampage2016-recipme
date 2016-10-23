class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.belongs_to :user, index: true
      t.string :name
      t.decimal :quantity
      t.string :unit
      t.boolean :purchased, default: false

      t.timestamps
    end
  end
end
