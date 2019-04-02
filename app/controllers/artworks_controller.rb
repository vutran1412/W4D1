class ArtworksController < ApplicationController

    def index
        @artworks = ArtWork.all
        render json: @artworks, status: 200
    end

    def create
        artwork = ArtWork.new(artworks_params)
        if artwork.save
            render json: artwork
        else
            render json: artwork.errors.full_messages, status: 422
        end
    end

    def show
        @artwork = ArtWork.find_by(id: params[:id])
        if @artwork
            render json: @artwork, status: 200
        else 
            render plain: "ArtWork does not exist", status: 422
        end
        @artwork
    end

    def update
        @artwork = ArtWork.find(params[:id])
        @artwork.update!(artwork_params)
        render json: @artwork

    end

    def delete
        ArtWork.find(params[:id]).destroy
        flash[:success] = "ArtWork deleted"
        redirect_to artworks_url
    end

    private
    def artworks_params
        params.require(:artwork).permit(:title, :image_url, :artist_id)
    end
end
