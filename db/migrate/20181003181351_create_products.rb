class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :description
      t.string :ingredient_list
      t.integer :brand_id
      
      t.timestamps null: false
    end
  end
end
