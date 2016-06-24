# == Schema Information
#
# Table name: artists
#
#  id         :integer          not null, primary key
#  name       :string
#  bio        :text
#  genre      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Artist < ApplicationRecord
  has_many :songs

  # SIZE = %w{small medium large}
  # validates :size inclusion: { in: Artist::SIZE }
  # validates :bio, length: { maximum: 250 }
  validates_presence_of :name, :bio, :genre
  validates :name, uniqueness: { case_sensitive: false}

  scope :pop, -> { where(genre: "Pop")}
  scope :artist_name, -> (name) {where(name: name)}
end
