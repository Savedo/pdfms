class Folder < ActiveRecord::Base
  belongs_to :folder, foreign_key: 'parent_id'

  def to_icon_name
    'folder-open'
  end
end
