class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :type, limit: 255
      t.string :slug, limit: 255
      t.string :name, limit: 255
      t.string :tags

      t.timestamps null: false
    end
  end
end
