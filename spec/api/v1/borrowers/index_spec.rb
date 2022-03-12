require "rails_helper"

RSpec.describe "borrowers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/borrowers", params: params
  end

  describe "basic fetch" do
    let!(:borrower1) { create(:borrower) }
    let!(:borrower2) { create(:borrower) }

    it "works" do
      expect(BorrowerResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["borrowers"])
      expect(d.map(&:id)).to match_array([borrower1.id, borrower2.id])
    end
  end
end
