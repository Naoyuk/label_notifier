require 'rails_helper'

RSpec.describe "labels/show", type: :view do
  before(:each) do
    assign(:label, Label.create!(
      title: "Title"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Title/)
  end
end
