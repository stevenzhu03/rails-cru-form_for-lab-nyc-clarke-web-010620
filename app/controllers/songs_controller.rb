class SongsController < ApplicationController

    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
        @genres = Genre.all
        @artists = Artist.all
    end

    def create
        @song = Song.create(post_params)
        redirect_to song_path(@song)
    end

    def show 
        @song = Song.find(params[:id])
    end

    def edit
        @genres = Genre.all
        @artists = Artist.all
        @song = Song.find(params[:id])
    end

    def update 
        @song = Song.find(params[:id])
        @song.update(post_params)
        redirect_to song_path(@song)
    end


    private

    def post_params
        params.require(:song).permit(:artist_id, :genre_id, :name)
    end
end
