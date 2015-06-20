class Template < Item
  has_attached_file :pdf
  has_attached_file :source

  validates_attachment :pdf, presence: true, content_type: { content_type: "application/pdf" }
  validates_attachment :source, presence: true

  def to_icon_name
    'file'
  end
end
