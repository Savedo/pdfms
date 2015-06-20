require 'rails_helper'

RSpec.describe "selectors/show", type: :view do
  before(:each) do
    @selector = assign(:selector, Selector.create!(
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
