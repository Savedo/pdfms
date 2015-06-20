class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :name, limit: 255

      t.timestamps null: false
    end
  end
end
