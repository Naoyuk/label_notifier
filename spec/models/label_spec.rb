require 'rails_helper'

RSpec.describe Label, type: :model do
  it "is invalid without title" do
    label_without_title = FactoryBot.build(:label, title:nil)
    expect(label_without_title).not_to be_valid
  end
end
