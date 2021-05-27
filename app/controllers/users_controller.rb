class UsersController < ApplicationController

    def create
        @user = User.create({
            username: params[:username],
            password: params[:password]
        })

        render json: @user, status: :created
    end

    def login 
        @user = User.find_by(
            username: params[:username]
        )
        if @user && @user.authenticate(params[:password])
            @token = JWT.encode({user_id: @user.id}, 'secret')

            render json: {token: @token}
        else
            render json: {error: "Invalid Credentials"}, status: :unauthorized
        end
    end

end
