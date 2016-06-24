# == Schema Information
#
# Table name: playlists
#
#  id               :integer          not null, primary key
#  title            :string
#  owner            :string
#  collaborative    :boolean
#  listen_count     :integer
#  song_count       :integer
#  song_added_by    :string
#  song_added_date  :date
#  subscriber_count :integer
#  genre_count      :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#

class Playlist < ApplicationRecord
  belongs_to :user
  has_many :playlist_songs
  has_many :songs, through: :playlist_songs
end
