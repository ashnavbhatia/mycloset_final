require 'rails_helper'

RSpec.describe ClothingPieceResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'clothing_pieces',
          attributes: { }
        }
      }
    end

    let(:instance) do
      ClothingPieceResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { ClothingPiece.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:clothing_piece) { create(:clothing_piece) }

    let(:payload) do
      {
        data: {
          id: clothing_piece.id.to_s,
          type: 'clothing_pieces',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      ClothingPieceResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { clothing_piece.reload.updated_at }
      # .and change { clothing_piece.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:clothing_piece) { create(:clothing_piece) }

    let(:instance) do
      ClothingPieceResource.find(id: clothing_piece.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { ClothingPiece.count }.by(-1)
    end
  end
end
