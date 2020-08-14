class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end 

    def new
        @recipe = Recipe.new
        if params[:counter]
            @counter = params[:counter].to_i + 1
           
        else 
            @counter = 1
        end
        @counter.times do 
            @ingredients = @recipe.ingredients.build
            @recipe_ingredients = @recipe.recipe_ingredients.build
        end
    end 

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save

            redirect_to recipe_path(@recipe)
        else 
            render 'new'
        end
    end 

    def edit

    end 

    def update

    end 

    def destroy

    end 

    private

    def set_recipe
        @recipe = Recipe.find(params[:id])
    end 

    def recipe_params
        params.require(:recipe).permit(
        :title, 
        :description,  
        :directions, 
        :prep_time, 
        :cook_time, 
        :servings, 
        :category_id,
        recipe_ingredients_attributes: [:id, :quantity, :ingredient_name])
    end 
end
