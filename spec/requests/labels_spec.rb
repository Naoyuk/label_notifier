# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/labels', type: :request do
  let(:valid_attributes) { FactoryBot.attributes_for(:label) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:label, title: nil) }

  describe 'GET /index' do
    it 'renders a successful response' do
      Label.create! valid_attributes
      get labels_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      label = Label.create! valid_attributes
      get label_url(label)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_label_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'renders a successful response' do
      label = Label.create! valid_attributes
      get edit_label_url(label)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Label' do
        expect do
          post labels_url, params: { label: valid_attributes }
        end.to change(Label, :count).by(1)
      end

      it 'redirects to the created label' do
        post labels_url, params: { label: valid_attributes }
        expect(response).to redirect_to(label_url(Label.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Label' do
        expect do
          post labels_url, params: { label: invalid_attributes }
        end.to change(Label, :count).by(0)
      end

      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post labels_url, params: { label: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { FactoryBot.attributes_for(:label, title: 'updated_title') }

      it 'updates the requested label' do
        label = Label.create! valid_attributes
        patch label_url(label), params: { label: new_attributes }
        label.reload
        expect(label.title).to eq 'updated_title'
      end

      it 'redirects to the label' do
        label = Label.create! valid_attributes
        patch label_url(label), params: { label: new_attributes }
        label.reload
        expect(response).to redirect_to(label_url(label))
      end
    end

    context 'with invalid parameters' do
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        label = Label.create! valid_attributes
        patch label_url(label), params: { label: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested label' do
      label = Label.create! valid_attributes
      expect do
        delete label_url(label)
      end.to change(Label, :count).by(-1)
    end

    it 'redirects to the labels list' do
      label = Label.create! valid_attributes
      delete label_url(label)
      expect(response).to redirect_to(labels_url)
    end
  end
end
