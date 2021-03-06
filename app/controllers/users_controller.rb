class UsersController < ApplicationController
    skip_before_action :verify_authenticity_token
    
    user.avatar.attach(user_paramss[:avatar])

    def user_paramss
        params.require(:user).permit(:name, :avatar)
    end
    
    # Index list all the users that exist
    def index
        @users = User.all
	end

    # create, creates a new user with the parameters that come from the request as json
	def new
	    @user = User.new
    end

    def create

	    @user = User.new(user_params)
        if @user.save
            @link = Link.new
            render :myprofile
        else
            render :new
        end
	end

    # update, updates all the information of a specific user, base on the id
	def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            @users = User.all
            render :index
        else
            render json: {status: 'ERROR', message: 'User not updated', data: @user.errors},status: :unprocessable_entity
        end
	end

    def edit
        @user = User.find(params[:id])
        render :update_user
    end

    #destroy, Deletes a specific user base on the id
	def destroy
        @user = User.find_by_id(params[:id])
        @users = User.all
        @user.destroy
        render :index
	end

    # show, display a specific user base on the id
    # get Users/:id
    def show
        @user = User.find(params[:id])
        @links = Link.where(user_id: @user.id)
        @link = Link.new
        render :full_profile
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
