require 'rails_helper'

RSpec.describe Print, type: :model do
  let(:valid_attributes) { FactoryBot.attributes_for(:label) }

  it "is invalid without related label" do
    print = Print.new(print_on: "2024-07-16", label_id: nil)
    expect(print).not_to be_valid
  end

  it "is invalid without print_on" do
    label = Label.create! valid_attributes
    print = Print.new(print_on: nil, label_id: label.id)
    expect(print).not_to be_valid
  end
end
