class ClothingPieceResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :title, :string
  attribute :description, :string
  attribute :image, :string
  attribute :clothing_type, :string
  attribute :brand_name, :string
  attribute :last_used_date, :date
  attribute :borrowed, :boolean
  attribute :borrower_id, :integer
  attribute :user_id, :integer

  # Direct associations

  belongs_to :borrower

  belongs_to :user

  # Indirect associations
end
