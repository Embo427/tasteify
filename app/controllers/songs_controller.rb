class SongsController < ApplicationController
  def index
    @songs = Song.all
  end

  def show
    @song = get_song
  end

  def new
    @song = Song.new
  end

  def create
   @song = Song.new(song_params)
   if @song.save
     redirect_to songs_path
   else
     render 'new' #render page again and tell user what's wrong
   end
  end

  private

  def song_params
    params.require(:song).permit(:title, :genre)
  end

  def get_song
    Song.find(params[:id])
  end

end
