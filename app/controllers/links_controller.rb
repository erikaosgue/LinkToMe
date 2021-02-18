
class LinksController < ApplicationController
    skip_before_action :verify_authenticity_token

    # index display a list of all the links that exist
    def index
        # hacer paginacion
        @links = Link.all
        render json: {status: 'SUCCESS', message: 'Loaded Links', data: @link},status: :ok
	end

    #create a new link object, the user_id is a must parameter
	def create
	    @link = Link.new(link_params)
        @user = User.find(@link.user_id)
	    # @link = @user.link.new(link_params)
        @links = @user.links
        
        if @link.save
            render :create_links
        else
            # will be redirect to get /users/:id => (Will be show in the action of User controller)
            # user_path(@user) => GET /users/:id
            redirect_to user_path(@user)
        end
	end


    #updte the link object base on the id
	def update
        @link = Link.find(params[:id])
        if @link.update(link_params)
            @user = User.find(@link.user_id)
            @links = Link.where(user_id: @user.id)
            render :create_links
        else
            render json: {status: 'ERROR', message: 'Link not updated', data: @link.errors},status: :unprocessable_entity
        end
	end

    def edit
        @link = Link.find(params[:id])
        @user = User.find(@link.user_id)
        render :update_link
    end
        
    #destroy an object base on the id
	def destroy
        @link = Link.find_by_id(params[:id])
        @user = User.find_by_id(@link.user_id)
        @links = Link.where(user_id: @link.user_id)
        @link.destroy
        render :create_links
	end

    # Return the link object base on the id
    def show
        @link = Link.find(params[:id])
        render json: {status: 'SUCCESS', message: 'Loaded Link', data: @link},status: :ok
        
    end

    # get /links/:id/user
    # Gets the user from the current links
    def user
        @link = Link.find(params[:id])
        render json: {status: 'SUCCESS', message: "Loaded Link's user", data: @link.user},status: :ok
    end

    private

    # return an object with the parameters that come from the request as Json
    def link_params
        params.require(:link).permit(:app_name, :url, :user_id)
    end
end
