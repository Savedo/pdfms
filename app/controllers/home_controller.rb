class HomeController < ApplicationController
  def index
    @folder_items = Folder.where(parent_id: nil).order(:name).to_a + Item.where(folder_id: nil).order(:name).to_a
  end
end
