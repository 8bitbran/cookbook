class RecipesController < ApplicationController

    def index
        @recipes = Recipe.all
    end 

    def new
        @recipe = Recipe.new
        @ingredients = @recipe.ingredients.build
    end 

    def create
        @recipe = Recipe.new(recipe_params)
        if @recipe.save 
            redirect_to recipe_path(@recipe.id)
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
            ingredients_attributes: [:id, :name, :_destroy])
    end 
end
