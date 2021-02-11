class UserController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def list_all_users
        @user = User.all
        render  json: @user
	end

	def create_user
        # puts user_params
	    @user = User.new(user_params)
        if @user.save
            render json: {status: 'SUCCESS', message: 'Saved User', data: @user},status: :ok
        #   redirect_to root_path, notice: "Succesfully created!"
        else
            render json: {status: 'ERROR', message: 'User not saved', data: @user.errors},status: :unprocessable_entity
        end
	end

	def update_user
	end

	def delete_user
	end

    private

    def user_params
        params.require(:user).permit(:username, :email)
    end
end
