class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.string :title
      t.text :description
      t.text :ingredients
      t.text :directions
      t.integer :prep_time
      t.integer :cook_time
      t.integer :servings
      t.integer :category_id
      t.integer :user_id

      t.timestamps
    end
  end
end
