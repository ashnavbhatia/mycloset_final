require 'rails_helper'

RSpec.describe "clothing_pieces#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/clothing_pieces", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'clothing_pieces',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(ClothingPieceResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { ClothingPiece.count }.by(1)
    end
  end
end
