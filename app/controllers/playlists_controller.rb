class PlaylistsController < ApplicationController
  def index
    @playlists = Playlist.all
  end

  def show
    @playlist = get_playlist
  end

  def new
    @playlist = Playlist.new
  end

  def create
   @playlist = Playlist.new(playlist_params)
   if @playlist.save
     redirect_to playlists_path
   else
     render 'new' #render page again and tell user what's wrong
   end
 end

  private

  def playlist_params
    params.require(:playlist).permit(:title, :collaborative)
  end

  def get_playlist
    Playlist.find(params[:id])
  end

end
