class ArtistsController < ApplicationController

  def index
    @artists = Artist.all
  end

  def show
    @artist = get_artist
  end

  private

  def artist_params
    params.require(:artist).permit(:name, :bio, :genre)
  end

  def get_artist
    Artist.find(params :id)
  end

end
