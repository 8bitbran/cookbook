class Recipe < ApplicationRecord
    belongs_to :user
    belongs_to :category
    has_many :recipe_ingredients
	has_many :ingredients, through: :recipe_ingredients
    accepts_nested_attributes_for :ingredients #,  allow_destroy: true, reject_if: :all_blank
    accepts_nested_attributes_for :recipe_ingredients
    validates :title, presence: true, length: { minimum: 4 }
    validates :description, presence: true, length: { in: 4..500 }
    validates :directions, presence: true, length: { minimum: 4 }
    validates :prep_time, presence: true
    validates :cook_time, presence: true
    validates :category_id, presence: true
    validates :user_id, presence: true
end
