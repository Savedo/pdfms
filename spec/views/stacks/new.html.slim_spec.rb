require 'rails_helper'

RSpec.describe "stacks/new", type: :view do
  before(:each) do
    assign(:stack, Stack.new(
      :slug => "MyString",
      :name => "MyString",
      :tags => "MyString"
    ))
  end

  it "renders new stack form" do
    render

    assert_select "form[action=?][method=?]", stacks_path, "post" do

      assert_select "input#stack_slug[name=?]", "stack[slug]"

      assert_select "input#stack_name[name=?]", "stack[name]"

      assert_select "input#stack_tags[name=?]", "stack[tags]"
    end
  end
end
