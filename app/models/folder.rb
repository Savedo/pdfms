class Folder < ActiveRecord::Base
  belongs_to :folder, foreign_key: 'parent_id'
end
