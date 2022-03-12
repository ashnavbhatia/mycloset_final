class ClothingPiecesController < ApplicationController
  before_action :set_clothing_piece, only: [:show, :edit, :update, :destroy]

  # GET /clothing_pieces
  def index
    @clothing_pieces = ClothingPiece.all
  end

  # GET /clothing_pieces/1
  def show
  end

  # GET /clothing_pieces/new
  def new
    @clothing_piece = ClothingPiece.new
  end

  # GET /clothing_pieces/1/edit
  def edit
  end

  # POST /clothing_pieces
  def create
    @clothing_piece = ClothingPiece.new(clothing_piece_params)

    if @clothing_piece.save
      redirect_to @clothing_piece, notice: 'Clothing piece was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /clothing_pieces/1
  def update
    if @clothing_piece.update(clothing_piece_params)
      redirect_to @clothing_piece, notice: 'Clothing piece was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /clothing_pieces/1
  def destroy
    @clothing_piece.destroy
    redirect_to clothing_pieces_url, notice: 'Clothing piece was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_clothing_piece
      @clothing_piece = ClothingPiece.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def clothing_piece_params
      params.require(:clothing_piece).permit(:title, :description, :image, :clothing_type, :brand_name, :last_used_date, :borrowed, :borrower_id, :user_id)
    end
end
