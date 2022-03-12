require 'rails_helper'

RSpec.describe "clothing_pieces#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/clothing_pieces/#{clothing_piece.id}"
  end

  describe 'basic destroy' do
    let!(:clothing_piece) { create(:clothing_piece) }

    it 'updates the resource' do
      expect(ClothingPieceResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { ClothingPiece.count }.by(-1)
      expect { clothing_piece.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
