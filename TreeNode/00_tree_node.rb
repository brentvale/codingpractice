class PolyTreeNode
  def initialize(value)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent
    @parent
  end
  
  def parent=(parent)
    unless @parent == nil
      #remove this node from previous parent
      @parent.children.delete(self)
    end
    @parent = parent
    unless @parent == nil
      @parent.children << self
    end
  end
  
  def children
    @children
  end
  
  def value
    @value
  end

  def add_child(child_node)
    @children << child_node
    child_node.parent = self
    
  end
  
  def remove_child(child)
    raise "Exception" if child.parent == nil
    child.parent = nil
    @children.delete(child)
  end

  def dfs(target_value)
    return self if self.value == target_value
    children.each do |child|
      result = child.dfs(target_value)
      return result unless result.nil?
    end
    return nil
  end

  def bfs(target_value)
    array = []
    array << self
    until array.empty?
      node = array.shift
      
      if node.value == target_value
        return node
      end
    
      array.concat(node.children)
      
    end
    
    return nil
  end

end