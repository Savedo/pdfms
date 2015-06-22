class CollectFolderItems
  attr_reader :folder
  def initialize(folder)
    @folder = folder
  end

  def execute
    if folder
      collect_regular_folder_items
    else
      collect_root_folder_items
    end
  end

  private
  
  def collect_regular_folder_items
    folder.subfolders.order(:name).to_a + folder.items.order(:name).to_a
  end

  def collect_root_folder_items
    Folder.where(parent_id: nil).order(:name).to_a + Item.where(folder_id: nil).order(:name).to_a
  end
end
