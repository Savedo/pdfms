require 'rails_helper'

RSpec.describe "versions/new", type: :view do
  before(:each) do
    assign(:version, Version.new(
      :description => "MyString"
    ))
  end

  it "renders new version form" do
    render

    assert_select "form[action=?][method=?]", versions_path, "post" do

      assert_select "input#version_description[name=?]", "version[description]"
    end
  end
end
