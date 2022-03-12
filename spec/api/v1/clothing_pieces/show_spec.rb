require "rails_helper"

RSpec.describe "clothing_pieces#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/clothing_pieces/#{clothing_piece.id}", params: params
  end

  describe "basic fetch" do
    let!(:clothing_piece) { create(:clothing_piece) }

    it "works" do
      expect(ClothingPieceResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("clothing_pieces")
      expect(d.id).to eq(clothing_piece.id)
    end
  end
end
