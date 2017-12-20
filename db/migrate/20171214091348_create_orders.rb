class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :billing_first_name
      t.string :billing_last_name
      t.string :billing_first_name_kana
      t.string :billing_last_name_kana
      t.string :billing_post_code
      t.string :billing_phone
      t.string :billing_address
      t.datetime :buy_at
      t.integer :total

      t.timestamps
    end
  end
end
