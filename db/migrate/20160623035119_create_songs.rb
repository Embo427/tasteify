class CreateSongs < ActiveRecord::Migration[5.0]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :genre
      t.integer :track_length
      t.integer :artist_id

      t.timestamps
    end
  end
end
