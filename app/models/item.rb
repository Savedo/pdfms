class Item < ActiveRecord::Base
  belongs_to :folder
  
  validates :slug, presence: true, uniqueness: true
  validates :name, presence: true
end
