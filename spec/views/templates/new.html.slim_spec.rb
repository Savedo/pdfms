require 'rails_helper'

RSpec.describe "templates/new", type: :view do
  before(:each) do
    assign(:template, Template.new(
      :slug => "MyString",
      :name => "MyString",
      :tags => "MyString"
    ))
  end

  it "renders new template form" do
    render

    assert_select "form[action=?][method=?]", templates_path, "post" do

      assert_select "input#template_slug[name=?]", "template[slug]"

      assert_select "input#template_name[name=?]", "template[name]"

      assert_select "input#template_tags[name=?]", "template[tags]"
    end
  end
end
