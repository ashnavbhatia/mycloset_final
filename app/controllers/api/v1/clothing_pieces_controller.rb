class Api::V1::ClothingPiecesController < Api::V1::GraphitiController
  def index
    clothing_pieces = ClothingPieceResource.all(params)
    respond_with(clothing_pieces)
  end

  def show
    clothing_piece = ClothingPieceResource.find(params)
    respond_with(clothing_piece)
  end

  def create
    clothing_piece = ClothingPieceResource.build(params)

    if clothing_piece.save
      render jsonapi: clothing_piece, status: :created
    else
      render jsonapi_errors: clothing_piece
    end
  end

  def update
    clothing_piece = ClothingPieceResource.find(params)

    if clothing_piece.update_attributes
      render jsonapi: clothing_piece
    else
      render jsonapi_errors: clothing_piece
    end
  end

  def destroy
    clothing_piece = ClothingPieceResource.find(params)

    if clothing_piece.destroy
      render jsonapi: { meta: {} }, status: :ok
    else
      render jsonapi_errors: clothing_piece
    end
  end
end
