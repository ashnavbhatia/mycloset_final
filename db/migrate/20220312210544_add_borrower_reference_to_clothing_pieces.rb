class AddBorrowerReferenceToClothingPieces < ActiveRecord::Migration[6.0]
  def change
    add_foreign_key :clothing_pieces, :borrowers
    add_index :clothing_pieces, :borrower_id
    change_column_null :clothing_pieces, :borrower_id, false
  end
end
