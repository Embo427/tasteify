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
    user = User.find_or_create_by(uid:uid, provider:provider)
    user.name = auth_hash['info']['name']
    user.username = auth_hash['info']['nickname']

    user.save!
    return user
  end
end
