require 'rails_helper'

RSpec.describe "stacks/show", type: :view do
  before(:each) do
    @stack = assign(:stack, Stack.create!(
      :slug => "Slug",
      :name => "Name",
      :tags => "Tags"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Slug/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Tags/)
  end
end
