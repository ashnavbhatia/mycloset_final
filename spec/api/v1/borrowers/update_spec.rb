require "rails_helper"

RSpec.describe "borrowers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/borrowers/#{borrower.id}", payload
  end

  describe "basic update" do
    let!(:borrower) { create(:borrower) }

    let(:payload) do
      {
        data: {
          id: borrower.id.to_s,
          type: "borrowers",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(BorrowerResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { borrower.reload.attributes }
    end
  end
end
