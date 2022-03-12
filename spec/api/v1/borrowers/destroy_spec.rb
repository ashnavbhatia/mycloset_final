require 'rails_helper'

RSpec.describe "borrowers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/borrowers/#{borrower.id}"
  end

  describe 'basic destroy' do
    let!(:borrower) { create(:borrower) }

    it 'updates the resource' do
      expect(BorrowerResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Borrower.count }.by(-1)
      expect { borrower.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
