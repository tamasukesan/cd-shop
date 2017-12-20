class CreateDiscs < ActiveRecord::Migration[5.1]
  def change
    create_table :discs do |t|
      t.integer :item_id
      t.integer :disc_number
      t.string :disc_name

      t.timestamps
    end
  end
end
