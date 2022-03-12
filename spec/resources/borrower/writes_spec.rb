require 'rails_helper'

RSpec.describe BorrowerResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'borrowers',
          attributes: { }
        }
      }
    end

    let(:instance) do
      BorrowerResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Borrower.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:borrower) { create(:borrower) }

    let(:payload) do
      {
        data: {
          id: borrower.id.to_s,
          type: 'borrowers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      BorrowerResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { borrower.reload.updated_at }
      # .and change { borrower.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:borrower) { create(:borrower) }

    let(:instance) do
      BorrowerResource.find(id: borrower.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Borrower.count }.by(-1)
    end
  end
end
