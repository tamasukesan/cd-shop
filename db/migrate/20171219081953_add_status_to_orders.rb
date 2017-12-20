class AddStatusToOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.integer :status, default: 0, null: false, limit: 1

      t.timestamps null: false
    end
    add_column :orders, :status, :integer
  end
end
