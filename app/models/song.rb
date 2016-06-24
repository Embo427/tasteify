# == Schema Information
#
# Table name: songs
#
#  id           :integer          not null, primary key
#  title        :string
#  genre        :string
#  track_length :integer
#  artist_id    :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Song < ApplicationRecord
  belongs_to :artist
  has_many :playlist_songs
  has_many :playlists, through: :playlist_songs
end
