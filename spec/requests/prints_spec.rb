# frozen_string_literal: true

require 'rails_helper'

RSpec.describe "/prints", type: :request do
  before do
    @label = FactoryBot.create(:label)
  end

  let(:valid_attributes) { FactoryBot.attributes_for(:print, label_id: @label.id) }
  let(:invalid_attributes) { FactoryBot.attributes_for(:print, label_id: nil) }

  describe "GET /index" do
    it "renders a successful response" do
      Print.create! valid_attributes
      get prints_url
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      print = Print.create! valid_attributes
      get print_url(print)
      expect(response).to be_successful
    end
  end

  describe "GET /new" do
    it "renders a successful response" do
      get new_print_url
      expect(response).to be_successful
    end
  end

  describe "GET /edit" do
    it "renders a successful response" do
      print = Print.create! valid_attributes
      get edit_print_url(print)
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Print" do
        expect {
          post prints_url, params: { print: valid_attributes }
        }.to change(Print, :count).by(1)
      end

      it "redirects to the created print" do
        post prints_url, params: { print: valid_attributes }
        expect(response).to redirect_to(print_url(Print.last))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Print" do
        expect {
          post prints_url, params: { print: invalid_attributes }
        }.to change(Print, :count).by(0)
      end

    
      it "renders a response with 422 status (i.e. to display the 'new' template)" do
        post prints_url, params: { print: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "PATCH /update" do
    context "with valid parameters" do
      let(:new_attributes) { FactoryBot.attributes_for(:print, print_on: "2000-01-01") }

      it "updates the requested print" do
        print = Print.create! valid_attributes
        patch print_url(print), params: { print: new_attributes }
        print.reload
        expect(print.print_on).to eq Date.new(2000, 1, 1)
      end

      it "redirects to the print" do
        print = Print.create! valid_attributes
        patch print_url(print), params: { print: new_attributes }
        print.reload
        expect(response).to redirect_to(print_url(print))
      end
    end

    context "with invalid parameters" do
    
      it "renders a response with 422 status (i.e. to display the 'edit' template)" do
        print = Print.create! valid_attributes
        patch print_url(print), params: { print: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
      end
    
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested print" do
      print = Print.create! valid_attributes
      expect {
        delete print_url(print)
      }.to change(Print, :count).by(-1)
    end

    it "redirects to the prints list" do
      print = Print.create! valid_attributes
      delete print_url(print)
      expect(response).to redirect_to(prints_url)
    end
  end
end
