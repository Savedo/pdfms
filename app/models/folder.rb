class Folder < ActiveRecord::Base
  belongs_to :folder, foreign_key: 'parent_id'

  has_many :items
  has_many :subfolders, class_name: 'Folder', foreign_key: 'parent_id'

  def to_icon_name
    'folder-open'
  end
end
