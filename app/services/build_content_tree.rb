class BuildContentTree
  def initialize
    @folder_nodes = Hash.new do |hash, id|
      hash[id] = Node.new
    end
    @root = Node.new
  end

  def execute
    build_folders_tree
    hang_items_on_tree
    @root
  end

  private

  def build_folders_tree
    Folder.order(:name).each { |f| add_folder(f) }
  end

  def add_folder(f)
    node = @folder_nodes[f.id]
    node.item = f

    parent_node = parent_node(f.parent_id)
    parent_node << node

    node
  end

  def hang_items_on_tree
    Item.order(:name).each { |item| hang_item(item) }
  end

  def parent_node(id)
    id ? @folder_nodes[id] : @root
  end

  def hang_item(item)
    node = Node.new(item)
    parent_node = parent_node(item.folder_id)
    parent_node << node
    node
  end
end
