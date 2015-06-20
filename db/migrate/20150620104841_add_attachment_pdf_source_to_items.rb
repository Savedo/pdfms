class AddAttachmentPdfSourceToItems < ActiveRecord::Migration
  def self.up
    change_table :items do |t|
      t.attachment :pdf
      t.attachment :source
    end
  end

  def self.down
    remove_attachment :items, :pdf
    remove_attachment :items, :source
  end
end
