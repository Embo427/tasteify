class UpdateAssociations < ActiveRecord::Migration[5.0]
  def change
    create_join_table :playlists, :songs, column_options: {null:true}

    create_table :playlists_artists, id: false do |t|
      t.belongs_to :playlist, index: true
      t.belongs_to :artist, index: true
    end

    change_table :artists do |t|
      t.remove :active, :fake
    end

    change_table :playlists do |t|
      t.integer :user_id
    end

  end
end
