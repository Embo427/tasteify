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
end
