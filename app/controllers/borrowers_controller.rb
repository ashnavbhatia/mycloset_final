class BorrowersController < ApplicationController
  before_action :set_borrower, only: %i[show edit update destroy]

  def index
    @q = Borrower.ransack(params[:q])
    @borrowers = @q.result(distinct: true).includes(:clothing_pieces).page(params[:page]).per(10)
  end

  def show
    @clothing_piece = ClothingPiece.new
  end

  def new
    @borrower = Borrower.new
  end

  def edit; end

  def create
    @borrower = Borrower.new(borrower_params)

    if @borrower.save
      redirect_to @borrower, notice: "Borrower was successfully created."
    else
      render :new
    end
  end

  def update
    if @borrower.update(borrower_params)
      redirect_to @borrower, notice: "Borrower was successfully updated."
    else
      render :edit
    end
  end

  def destroy
    @borrower.destroy
    redirect_to borrowers_url, notice: "Borrower was successfully destroyed."
  end

  private

  def set_borrower
    @borrower = Borrower.find(params[:id])
  end

  def borrower_params
    params.require(:borrower).permit(:name, :contact)
  end
end
