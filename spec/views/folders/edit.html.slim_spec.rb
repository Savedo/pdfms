require 'rails_helper'

RSpec.describe "folders/edit", type: :view do
  before(:each) do
    @folder = assign(:folder, Folder.create!(
      :name => "MyString",
      :parent_id => 1
    ))
  end

  it "renders the edit folder form" do
    render

    assert_select "form[action=?][method=?]", folder_path(@folder), "post" do

      assert_select "input#folder_name[name=?]", "folder[name]"

      assert_select "input#folder_parent_id[name=?]", "folder[parent_id]"
    end
  end
end
