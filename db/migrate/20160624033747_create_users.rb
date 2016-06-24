class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email_address
      t.string :password
      t.string :username
      t.string :image
      t.integer :playlist_count

      t.timestamps
    end
  end
end
