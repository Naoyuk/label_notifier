require 'rails_helper'

RSpec.describe "labels/edit", type: :view do
  let(:label) {
    Label.create!(
      title: "MyString"
    )
  }

  before(:each) do
    assign(:label, label)
  end

  it "renders the edit label form" do
    render

    assert_select "form[action=?][method=?]", label_path(label), "post" do

      assert_select "input[name=?]", "label[title]"
    end
  end
end
