class BorrowersController < ApplicationController
  before_action :set_borrower, only: [:show, :edit, :update, :destroy]

  # GET /borrowers
  def index
    @borrowers = Borrower.all
  end

  # GET /borrowers/1
  def show
    @clothing_piece = ClothingPiece.new
  end

  # GET /borrowers/new
  def new
    @borrower = Borrower.new
  end

  # GET /borrowers/1/edit
  def edit
  end

  # POST /borrowers
  def create
    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      redirect_to @borrower, notice: 'Borrower was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /borrowers/1
  def update
    if @borrower.update(borrower_params)
      redirect_to @borrower, notice: 'Borrower was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /borrowers/1
  def destroy
    @borrower.destroy
    redirect_to borrowers_url, notice: 'Borrower was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_borrower
      @borrower = Borrower.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def borrower_params
      params.require(:borrower).permit(:name, :contact)
    end
end
