class AddUserReferenceToClothingPieces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :clothing_pieces, :users
    add_index :clothing_pieces, :user_id
    change_column_null :clothing_pieces, :user_id, false
  end
end
