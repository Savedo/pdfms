require 'rails_helper'

RSpec.describe "templates/show", type: :view do
  before(:each) do
    @template = assign(:template, Template.create!(
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
