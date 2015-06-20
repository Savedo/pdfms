require 'rails_helper'

RSpec.describe "selectors/new", type: :view do
  before(:each) do
    assign(:selector, Selector.new(
      :slug => "MyString",
      :name => "MyString",
      :tags => "MyString"
    ))
  end

  it "renders new selector form" do
    render

    assert_select "form[action=?][method=?]", selectors_path, "post" do

      assert_select "input#selector_slug[name=?]", "selector[slug]"

      assert_select "input#selector_name[name=?]", "selector[name]"

      assert_select "input#selector_tags[name=?]", "selector[tags]"
    end
  end
end
