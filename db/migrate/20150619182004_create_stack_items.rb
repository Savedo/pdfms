class CreateStackItems < ActiveRecord::Migration
  def change
    create_table :stack_items do |t|
      t.integer :stack_id
      t.integer :item_id
      t.integer :place

      t.timestamps null: false
    end
    add_index :stack_items, :stack_id
    add_index :stack_items, :item_id
  end
end
