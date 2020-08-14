class RecipeIngredient < ApplicationRecord
    belongs_to :recipe
    belongs_to :ingredient
    validates :quantity, presence: true

    def ingredient_name=(name)
        ingredient = Ingredient.find_or_create_by(name: name)
        self.ingredient_id = ingredient.id
    end 

    def ingredient_name
        if ingredient
            ingredient.name 
        else
            nil 
        end
    end 
end
