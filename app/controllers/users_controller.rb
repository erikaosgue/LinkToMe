class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    # Index list all the users that exist
    def index
        @users = User.all
        # render json: {status: 'SUCCESS', message: 'Loaded Users', data: @user},status: :ok
	end

    # create, creates a new user with the parameters that come from the request as json
	def new
	    @user = User.new
    end

    def create

	    @user = User.new(user_params)
        if @user.save
        #     render json: {status: 'SUCCESS', message: 'Saved User', data: @user},status: :ok
            # redirect_to myprofile_path(@user), notice: "Succesfully created!"
            # redirect_to myprofile_path[:user], notice: "Succesfully created!"
            render :myprofile
        else
            render json: {status: 'ERROR', message: 'User not saved', data: @user.errors},status: :unprocessable_entity
        end
	end

    # update, updates all the information of a specific user, base on the id
	def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            render json: {status: 'SUCCESS', message: 'Updated User', data: @user},status: :ok
        else
            render json: {status: 'ERROR', message: 'User not updated', data: @user.errors},status: :unprocessable_entity
        end
	end

    #destroy, Deletes a specific user base on the id
	def destroy
        @user = User.find_by_id(params[:id])
        @user.destroy
        render json: {status: 'SUCCESS', message: 'Delete User', data: @user}, status: :ok
	end

    # show, display a specific user base on the id
    def show
        @user = User.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded User', data: @user},status: :ok
    end

    # links, will display all the links of a specific user base on the id
    def links
        @user = User.find(params[:id])
        render json: {status: 'SUCCESS', message: 'List all Links in User', data: @user.links},status: :ok
    end


    def myprofile
    end

    private

    #user_params will check for the user class and only permit username and email parameters
    def user_params
        params.require(:user).permit(:username, :email, :description)
    end
end
