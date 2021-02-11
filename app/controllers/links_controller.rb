
class LinksController < ApplicationController
    skip_before_action :verify_authenticity_token

    # index display a list of all the links that exist
    def index
        @link = Link.all
        render json: {status: 'SUCCESS', message: 'Loaded Links', data: @link},status: :ok
	end

    #create a new link object, the user_id is a must parameter
	def create
	    @link = Link.new(link_params)
        if @link.save
            render json: {status: 'SUCCESS', message: 'Saved Link', data: @link},status: :ok
        #   redirect_to root_path, notice: "Succesfully created!"
        else
            render json: {status: 'ERROR', message: 'Link not saved', data: @link.errors},status: :unprocessable_entity
        end
	end


    #updte the link object base on the id
	def update
        @link = Link.find(params[:id])
        if @link.update(link_params)
            render json: {status: 'SUCCESS', message: 'Updated Link', data: @link},status: :ok
        else
            render json: {status: 'ERROR', message: 'Link not updated', data: @link.errors},status: :unprocessable_entity
        end
	end

    #destroy an object base on the id
	def destroy
        @link = Link.find_by_id(params[:id])
        @link.destroy
        render json: {status: 'SUCCESS', message: 'Delete Link', data: @link}, status: :ok
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
