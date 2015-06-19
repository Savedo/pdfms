class Version < ActiveRecord::Base
  belongs_to :template

  has_attached_file :pdf_template
  has_attached_file :in_design_source

  validates :pdf_template, attachment_presence: true, attachment_content_type: { content_type: "application/pdf" }
  validates :in_design_source, attachment_presence: true
end
