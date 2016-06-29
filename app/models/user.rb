# == Schema Information
#
# Table name: users
#
#  id             :integer          not null, primary key
#  name           :string
#  email_address  :string
#  password       :string
#  username       :string
#  image          :string
#  playlist_count :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class User < ApplicationRecord
  has_many :playlists

  def self.from_omniauth(auth_hash)
    uid = auth_hash['uid']
    provider = auth_hash['provider']
    user = User.find_or_create_by(username:uid)
    user.name = auth_hash['info']['display_name']
    user.image = auth_hash['info']['images'][0]['url']
    user.save!
    return user
  end

  # def self.get_playlists()
  #  results = Yelp.client.search(city, {term: term})
  #  results.businesses.each do |business|
  #    b = Business.new
  #    b.name = business.name
  #    b.city = business.location.city
  #    b.postal_code = business.location.postal_code business.location.postal_code
  #    b.rating = business.rating
  #    b.yelp_uid = business.id
  #    b.save!
  #  end

  #  def self.spotify(auth_hash)
  #   uid = auth_hash['uid']
  #   binding.pry
  #   response = RestClient.get("https://api.spotify.com/v1/#{uid}")

    # current_user
    #
    # # Access private data
    # spotify_user.country #=> "US"
    # spotify_user.email   #=> "example@email.com"
    #
    # # Create playlist in user's Spotify account
    # playlist = spotify_user.create_playlist!('my-awesome-playlist')
    #
    # # Add tracks to a playlist in user's Spotify account
    # tracks = RSpotify::Track.search('Know')
    # playlist.add_tracks!(tracks)
    # playlist.tracks.first.name #=> "Somebody That I Used To Know"
    #
    # # Access and modify user's music library
    # spotify_user.save_tracks!(tracks)
    # spotify_user.saved_tracks.size #=> 20
    # spotify_user.remove_tracks!(tracks)
    #
    # albums = RSpotify::Album.search('launeddas')
    # spotify_user.save_albums!(albums)
    # spotify_user.saved_albums.size #=> 10
    # spotify_user.remove_albums!(albums)
    #
    # # Use Spotify Follow features
    # spotify_user.follow(playlist)
    # spotify_user.follows?(artists)
    # spotify_user.unfollow(users)
    #
    # # Get user's top played artists and tracks
    # spotify_user.top_artists #=> (Artist array)
    # spotify_user.top_tracks(time_range: 'short_term') #=> (Track array)
    #
    # # Check doc for more
  # end

end
