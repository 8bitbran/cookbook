class SessionsController < ApplicationController

    def new 
        
    end 

    def create
        if auth
            #facebook sign in flow
            @user = User.find_or_create_by(email: auth['info']['email']) do |u|
                u.name = auth['info']['name']
                u.email = auth['info']['email']
                u.image = auth['info']['image']
                u.uid = auth['uid']
            end
             
                session[:user_id] = @user.id
             
                redirect_to user_path(@user)
        else 
            #normal sign in flow
            @user = User.find_by(email: params[:email])
            if @user && @user.authenticate(params[:password])
                session[:user_id] = @user.id
                redirect_to user_path(@user)
            else 
                @error = "Oops! Please enter a valid login."
                render 'new'
            end 
        end 
    end 

    def destroy 
        session.delete :user_id
        redirect_to '/signin'
    end 

    private

    def auth
        request.env['omniauth.auth']
    end

end
