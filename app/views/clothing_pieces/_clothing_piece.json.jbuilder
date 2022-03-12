json.extract! clothing_piece, :id, :title, :description, :image,
              :clothing_type, :brand_name, :last_used_date, :borrowed, :borrower_id, :user_id, :created_at, :updated_at
json.url clothing_piece_url(clothing_piece, format: :json)
