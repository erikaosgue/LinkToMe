class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    def index
        @user = User.all
        render  json: @user
	end

	def create
        # puts user_params
	    @user = User.new(user_params)
        if @user.save
            render json: {status: 'SUCCESS', message: 'Saved User', data: @user},status: :ok
        #   redirect_to root_path, notice: "Succesfully created!"
        else
            render json: {status: 'ERROR', message: 'User not saved', data: @user.errors},status: :unprocessable_entity
        end
	end

	def update
        @user = User.find(params[:id])
        if @user.update_attributes(user_params)
            render json: {status: 'SUCCESS', message: 'Updated User', data: @user},status: :ok
        else
            render json: {status: 'ERROR', message: 'User not updated', data: @user.errors},status: :unprocessable_entity
        end
	end

	def destroy
        @user = User.find(params[:id])
        @user.destroy
        render json: {status: 'SUCCESS', message: 'Delete article', data: @user}, status: :ok
	end

    # def show
    #     @user = User.find(params[:id])
    #     @user.
    # end

    private

    def user_params
        params.require(:user).permit(:username, :email)
        print 'here => ', params.require(:user).permit(:username, :email)
    end
end
