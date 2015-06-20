class Node
  attr_accessor :item
  attr_reader :children
  delegate :name, to: :item

  def initialize(item = nil)
    @item = item
    @children = []
  end

  def <<(node)
    @children << node
    self
  end

  def root?
    !@item
  end

  def folder?
    root? || item.is_a?(Folder)
  end
end
