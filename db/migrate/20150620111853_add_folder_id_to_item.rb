class AddFolderIdToItem < ActiveRecord::Migration
  def change
    add_column :items, :folder_id, :integer
    add_index :items, :folder_id
  end
end
