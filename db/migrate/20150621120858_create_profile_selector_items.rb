class CreateProfileSelectorItems < ActiveRecord::Migration
  def change
    create_table :profile_selector_items do |t|
      t.integer :profile_id
      t.integer :selector_id
      t.integer :item_id

      t.timestamps null: false
    end
    add_index :profile_selector_items, :profile_id
    add_index :profile_selector_items, :selector_id
    add_index :profile_selector_items, :item_id
  end
end
