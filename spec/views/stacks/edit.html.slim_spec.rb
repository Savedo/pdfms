require 'rails_helper'

RSpec.describe "stacks/edit", type: :view do
  before(:each) do
    @stack = assign(:stack, Stack.create!(
      :slug => "MyString",
      :name => "MyString",
      :tags => "MyString"
    ))
  end

  it "renders the edit stack form" do
    render

    assert_select "form[action=?][method=?]", stack_path(@stack), "post" do

      assert_select "input#stack_slug[name=?]", "stack[slug]"

      assert_select "input#stack_name[name=?]", "stack[name]"

      assert_select "input#stack_tags[name=?]", "stack[tags]"
    end
  end
end
