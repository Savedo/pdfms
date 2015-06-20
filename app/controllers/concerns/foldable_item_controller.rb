module FoldableItemController
  extend ActiveSupport::Concern

  included do
    before_filter :set_parent_folder, only: %i(new create)
  end

  private

  def set_parent_folder
    id = params[:folder_id] || params[:parent_id]
    @parent_folder = Folder.find(id) if id
  end
end
