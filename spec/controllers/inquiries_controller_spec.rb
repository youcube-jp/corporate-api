require 'rails_helper'

RSpec.describe InquiriesController, type: :controller do
  let(:valid_attributes) {
    attributes_for(:inquiry)
  }

  describe 'POST create' do
    context 'with valid params' do
      subject { post :create, valid_attributes }

      it 'creates a new Inquiry' do
        expect { subject }.to change(Inquiry, :count).by(1)
      end

      it 'assigns a newly created inquiry as @inquiry' do
        subject
        expect(assigns(:inquiry)).to be_a(Inquiry)
        expect(assigns(:inquiry)).to be_persisted
      end

      it 'returns 201 CREATED' do
        subject
        expect(response.status).to eq 201
        expect(response.body).to include 'CREATED'
      end
    end

    describe 'with invalid params' do
      it 'returns 422 UNPROCESSABLE ENTITY' do
        post :create
        expect(response.status).to eq 422
        expect(response.body).to include 'UNPROCESSABLE_ENTITY'
      end
    end
  end
end
