require 'rails_helper'

RSpec.describe "selectors/edit", type: :view do
  before(:each) do
    @selector = assign(:selector, Selector.create!(
      :slug => "MyString",
      :name => "MyString",
      :tags => "MyString"
    ))
  end

  it "renders the edit selector form" do
    render

    assert_select "form[action=?][method=?]", selector_path(@selector), "post" do

      assert_select "input#selector_slug[name=?]", "selector[slug]"

      assert_select "input#selector_name[name=?]", "selector[name]"

      assert_select "input#selector_tags[name=?]", "selector[tags]"
    end
  end
end
