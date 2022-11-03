class AddUserAndPostRefToCommnets < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :user, null: false, foreign_key: { to_table: :users }
    add_reference :comments, :post, null: false, foreign_key: true
  end
end
