require 'rails_helper'

RSpec.describe "clothing_pieces#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/clothing_pieces/#{clothing_piece.id}", payload
  end

  describe 'basic update' do
    let!(:clothing_piece) { create(:clothing_piece) }

    let(:payload) do
      {
        data: {
          id: clothing_piece.id.to_s,
          type: 'clothing_pieces',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(ClothingPieceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { clothing_piece.reload.attributes }
    end
  end
end
