require "rails_helper"

RSpec.describe BorrowerResource, type: :resource do
  describe "serialization" do
    let!(:borrower) { create(:borrower) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(borrower.id)
      expect(data.jsonapi_type).to eq("borrowers")
    end
  end

  describe "filtering" do
    let!(:borrower1) { create(:borrower) }
    let!(:borrower2) { create(:borrower) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: borrower2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([borrower2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:borrower1) { create(:borrower) }
      let!(:borrower2) { create(:borrower) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      borrower1.id,
                                      borrower2.id,
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
                                      borrower2.id,
                                      borrower1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
