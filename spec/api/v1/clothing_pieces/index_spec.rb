require 'rails_helper'

RSpec.describe "clothing_pieces#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/clothing_pieces", params: params
  end

  describe 'basic fetch' do
    let!(:clothing_piece1) { create(:clothing_piece) }
    let!(:clothing_piece2) { create(:clothing_piece) }

    it 'works' do
      expect(ClothingPieceResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['clothing_pieces'])
      expect(d.map(&:id)).to match_array([clothing_piece1.id, clothing_piece2.id])
    end
  end
end
