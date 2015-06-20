require 'rails_helper'

RSpec.describe "folders/index", type: :view do
  before(:each) do
    assign(:folders, [
      Folder.create!(
        :name => "Name",
        :parent_id => 1
      ),
      Folder.create!(
        :name => "Name",
        :parent_id => 1
      )
    ])
  end

  it "renders a list of folders" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
