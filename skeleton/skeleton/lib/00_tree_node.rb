class PolyTreeNode

    attr_reader :parent, :children, :value

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

    def parent=(new_parent)
        @parent.children.delete(self) if !@parent.nil?
        @parent = new_parent
        if !new_parent.nil?
            new_parent.children << self if !new_parent.children.include?(self)
        end
    end

    def add_child(child_node)
        child_node.parent =  self if child_node.parent != self
    end

    def remove_child(child_node)
        child_node.parent = nil
       
        raise "error" if !@children.include?(child_node)
    end

    def dfs(target_value)
        return self if target_value == self.value
        @children.each do |child|
            if child.dfs(target_value)
                return child.dfs(target_value)
            end 
        end
        return nil
    end




end