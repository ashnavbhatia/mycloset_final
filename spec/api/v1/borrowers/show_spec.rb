require "rails_helper"

RSpec.describe "borrowers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/borrowers/#{borrower.id}", params: params
  end

  describe "basic fetch" do
    let!(:borrower) { create(:borrower) }

    it "works" do
      expect(BorrowerResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("borrowers")
      expect(d.id).to eq(borrower.id)
    end
  end
end
