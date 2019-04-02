class ArtworksharesController < ApplicationController

    def index
        @artworkshares = ArtworkShare.all
        render json: @artworkshares
    end

    def create
        artworkshare = ArtworkShare.new(shares_params)
        if artworkshare.save
            render json: artworkshare
        else
            render json: artworkshare.errors.full_messages, status: 422
        end
    end

    def show
        @share = ArtworkShare.find_by(id: params[:id])
        if @share
            render json: @share
        else 
            render plain: "User does not exist", status: 422
        end
    end

    def update
        @share = ArtworkShare.find(params[:id])
        @share.update!(shares_params)
        render json: @share

    end

    def delete
        ArtworkShare.find(params[:id]).destroy
        flash[:success] = "User deleted"
        redirect_to users_url
    end

    private
    def shares_params
        params.require(:artworkshare).permit(:artwork_id, :viewer_id)
    end

end
