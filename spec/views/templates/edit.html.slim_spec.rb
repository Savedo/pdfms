require 'rails_helper'

RSpec.describe "templates/edit", type: :view do
  before(:each) do
    @template = assign(:template, Template.create!(
      :slug => "MyString",
      :name => "MyString",
      :tags => "MyString"
    ))
  end

  it "renders the edit template form" do
    render

    assert_select "form[action=?][method=?]", template_path(@template), "post" do

      assert_select "input#template_slug[name=?]", "template[slug]"

      assert_select "input#template_name[name=?]", "template[name]"

      assert_select "input#template_tags[name=?]", "template[tags]"
    end
  end
end
