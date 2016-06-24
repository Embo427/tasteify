class AddActiveToArtists < ActiveRecord::Migration[5.0]
  def change
    add_column :artists, :active, :boolean
    add_column :artists, :fake, :text
  end
end
