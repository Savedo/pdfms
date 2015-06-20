require 'rails_helper'

RSpec.describe "selectors/index", type: :view do
  before(:each) do
    assign(:selectors, [
      Selector.create!(
        :slug => "Slug",
        :name => "Name",
        :tags => "Tags"
      ),
      Selector.create!(
        :slug => "Slug",
        :name => "Name",
        :tags => "Tags"
      )
    ])
  end

  it "renders a list of selectors" do
    render
    assert_select "tr>td", :text => "Slug".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Tags".to_s, :count => 2
  end
end
