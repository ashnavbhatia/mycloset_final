class Api::V1::BorrowersController < Api::V1::GraphitiController
  def index
    borrowers = BorrowerResource.all(params)
    respond_with(borrowers)
  end

  def show
    borrower = BorrowerResource.find(params)
    respond_with(borrower)
  end

  def create
    borrower = BorrowerResource.build(params)

    if borrower.save
      render jsonapi: borrower, status: 201
    else
      render jsonapi_errors: borrower
    end
  end

  def update
    borrower = BorrowerResource.find(params)

    if borrower.update_attributes
      render jsonapi: borrower
    else
      render jsonapi_errors: borrower
    end
  end

  def destroy
    borrower = BorrowerResource.find(params)

    if borrower.destroy
      render jsonapi: { meta: {} }, status: 200
    else
      render jsonapi_errors: borrower
    end
  end
end
