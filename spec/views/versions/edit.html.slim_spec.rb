require 'rails_helper'

RSpec.describe "versions/edit", type: :view do
  before(:each) do
    @version = assign(:version, Version.create!(
      :description => "MyString"
    ))
  end

  it "renders the edit version form" do
    render

    assert_select "form[action=?][method=?]", version_path(@version), "post" do

      assert_select "input#version_description[name=?]", "version[description]"
    end
  end
end
