class CreateVersions < ActiveRecord::Migration
  def change
    create_table :versions do |t|
      t.string :description, limit: 255
      t.integer :template_id

      t.timestamps null: false
    end
    add_index :versions, :template_id
  end
end
