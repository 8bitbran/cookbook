class RecipesController < ApplicationController
    before_action :require_login
    skip_before_action :require_login, only: [:index, :show]


    def index
        @recipes = Recipe.all
    end 

    def show 
        set_recipe
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
        @recipe = current_user.recipes.build(recipe_params)
        if @recipe.save
            redirect_to @recipe
        else 
            render :new
        end
    end 

    def edit
        set_recipe
    end 

    def update
        set_recipe
        @recipe.update(recipe_params)

        if @recipe.save
            redirect_to @recipe
        else
            render :edit
        end
    end 

    def destroy
        set_recipe
        @recipe.destroy
        flash[:notice] = "You deleted a recipe."
        redirect_to '/'
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
