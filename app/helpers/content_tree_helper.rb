module ContentTreeHelper
  def build_and_render_content_tree
    render_content_tree(BuildContentTree.new.execute, %w(nav-sidebar))
  end

  def render_content_tree(root, classes = [])
    render_content_tree_node_children(root.children, classes + %w(content-tree))
  end

  def render_content_tree_node(node)
    content_tag_for(:li, node.item, class: ['node', (node.folder?  ? 'node-folder-closed' : 'item')] ) do
      content_tree_node_content(node) + (node.folder? ? render_content_tree_node_children(node.children) : ''.html_safe)
    end
  end

  def render_content_tree_node_children(children, classes = nil)
    content_tag(:ul, class: (classes || %w(children)) + %w(nav)) do
      children.map { |child| render_content_tree_node(child) }.join.html_safe
    end
  end

  def content_tree_node_content(node)
    link_to(node.item, remote: true) do
      if node.folder?
        icon_tag('folder-close') + icon_tag('folder-open') + node.name.html_safe.html_safe
      else
        item_icon_tag(node.item) + node.name.html_safe
      end
    end
  end
end
