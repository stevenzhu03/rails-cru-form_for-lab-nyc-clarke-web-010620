class ArtistsController < ApplicationController
    
    def index
        @artists = Artist.all
    end


    def new
        @artist = Artist.new
    end

    def create 
        Artist.create(post_params(:name, :bio))
        redirect_to artists_path
    end

    def show
        @artist = Artist.find(params[:id])
    end

    def edit
        @artist = Artist.find(params[:id])
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(post_params(:name, :bio))
        redirect_to artist_path
    end

private

    def post_params(*args)
        params.require(:artist).permit(*args)
    end

end