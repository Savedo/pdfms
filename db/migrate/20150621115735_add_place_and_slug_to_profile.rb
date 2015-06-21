class AddPlaceAndSlugToProfile < ActiveRecord::Migration
  def change
    add_column :profiles, :slug, :string
    add_column :profiles, :place, :integer
  end
end
