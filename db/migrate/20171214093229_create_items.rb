class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :adminster_id
      t.string :artist_name
      t.string :artist_name_kana
      t.string :album_name
      t.string :cd_image_id
      t.integer :price
      t.string :label_name
      t.string :genre
      t.integer :stock
      t.datetime :luanch_date
      t.string :editor
      t.integer :item_status
      
      t.timestamps
    end
  end
end
