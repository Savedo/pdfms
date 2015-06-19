class AddAttachmentPdfTemplateInDesignSourceToVersions < ActiveRecord::Migration
  def self.up
    change_table :versions do |t|
      t.attachment :pdf_template
      t.attachment :in_design_source
    end
  end

  def self.down
    remove_attachment :versions, :pdf_template
    remove_attachment :versions, :in_design_source
  end
end
