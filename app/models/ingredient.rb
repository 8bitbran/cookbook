class Ingredient < ApplicationRecord
    has_many :recipe_ingredients
	has_many :recipes, through: :recipe_ingredients
    validates :name, presence: true,
                   uniqueness: { case_sensitive: false},
                   length: { minimum: 3, maximum: 25 }
end
