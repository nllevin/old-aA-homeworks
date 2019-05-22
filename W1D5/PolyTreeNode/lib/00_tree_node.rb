class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent
        @parent
    end

    def children
        @children
    end

    def value
        @value
    end

    def parent=(parent_node)
        @parent.children.delete(self) unless @parent.nil?
        @parent = parent_node
        parent_node.children << self unless parent_node.nil?
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        raise unless @children.include?(child_node)
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if @value == target_value
        @children.each do |child| 
            search_result = child.dfs(target_value)
            return search_result unless search_result.nil?
        end
        nil
    end

    def bfs(target_value)
        queue = [self]
        until queue.empty?
            el = queue.shift
            return el if el.value == target_value
            queue += el.children
        end
        nil
    end
end