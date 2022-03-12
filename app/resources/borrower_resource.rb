class BorrowerResource < ApplicationResource
  attribute :id, :integer, writable: false
  attribute :created_at, :datetime, writable: false
  attribute :updated_at, :datetime, writable: false
  attribute :name, :string
  attribute :contact, :string

  # Direct associations

  has_many   :clothing_pieces

  # Indirect associations

end
