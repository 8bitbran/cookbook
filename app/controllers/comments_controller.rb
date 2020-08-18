class CommentsController < ApplicationController
    def create
        @recipe = Recipe.find(params[:recipe_id])
        @comment = @recipe.comments.create(comment_params)
        @comment.user_id = current_user.id 
        if @comment.save
            redirect_to @recipe
        else
            flash.now[:danger] = "error"
        end
    end 

    private

    def comment_params
        params.require(:comment).permit(:description)
    end 
end
