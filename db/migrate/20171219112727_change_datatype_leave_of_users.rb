class ChangeDatatypeLeaveOfUsers < ActiveRecord::Migration[5.1]
  def change
  	change_column :users, :leave, :boolean, default: true
  end
end
