class UsersController < ApplicationController

    
    def index
        @users = User.all
        render json: @users
    end

    def create
        user = User.new(user_params)
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: 422
        end
    end

    def show
        @user = User.find_by(id: params[:id])
        if @user
            render json: @user
        else 
            render plain: "User does not exist", status: 422
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update!(user_params)
        render json: @user

    end

    def delete
        User.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end

    private
    def user_params
        params.require(:user).permit(:username)
    end
end
