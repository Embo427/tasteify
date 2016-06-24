class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = get_artist
  end

  def new
   @artist = Artist.new
  end

  def create
   @artist = Artist.new(artist_params)
   if @artist.save
     redirect_to artists_path
   else
     render 'new' #render page again and tell user what's wrong
   end
 end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio, :genre)
  end

  def get_artist
    Artist.find(params[:id])
  end

  # def get_artist_songs
  #   Artist.find(params[:id]).songs
  # end

end
