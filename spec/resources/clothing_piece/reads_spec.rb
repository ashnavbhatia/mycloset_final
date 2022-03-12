require "rails_helper"

RSpec.describe ClothingPieceResource, type: :resource do
  describe "serialization" do
    let!(:clothing_piece) { create(:clothing_piece) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(clothing_piece.id)
      expect(data.jsonapi_type).to eq("clothing_pieces")
    end
  end

  describe "filtering" do
    let!(:clothing_piece1) { create(:clothing_piece) }
    let!(:clothing_piece2) { create(:clothing_piece) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: clothing_piece2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([clothing_piece2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:clothing_piece1) { create(:clothing_piece) }
      let!(:clothing_piece2) { create(:clothing_piece) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      clothing_piece1.id,
                                      clothing_piece2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      clothing_piece2.id,
                                      clothing_piece1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
