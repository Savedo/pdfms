require 'rails_helper'

RSpec.describe "versions/index", type: :view do
  before(:each) do
    assign(:versions, [
      Version.create!(
        :description => "Description"
      ),
      Version.create!(
        :description => "Description"
      )
    ])
  end

  it "renders a list of versions" do
    render
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
