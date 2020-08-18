class LikesController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_id])
        @like = @recipe.likes.create
        @like.user_id = current_user.id 
        if @like.save
            redirect_to @recipe
        else
            flash.now[:danger] = "error"
        end
    end 
end
