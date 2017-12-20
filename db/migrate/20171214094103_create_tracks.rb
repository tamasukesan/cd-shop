class CreateTracks < ActiveRecord::Migration[5.1]
  def change
    create_table :tracks do |t|
      t.integer :disc_id
      t.integer :track_number
      t.string :track_name
      t.string :artist_name

      t.timestamps
    end
  end
end
