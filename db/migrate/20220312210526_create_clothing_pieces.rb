class CreateClothingPieces < ActiveRecord::Migration[6.0]
  def change
    create_table :clothing_pieces do |t|
      t.string :title
      t.text :description
      t.string :image
      t.string :clothing_type
      t.string :brand_name
      t.date :last_used_date
      t.boolean :borrowed
      t.integer :borrower_id
      t.integer :user_id

      t.timestamps
    end
  end
end
