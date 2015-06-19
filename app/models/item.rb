class Item < ActiveRecord::Base
  validates :slug, presence: true, uniqueness: true
  validates :name, presence: true

  def to_param
    slug
  end
end
