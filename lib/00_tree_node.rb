require 'byebug'

class PolyTreeNode
    attr_reader :value, :parent, :children 

    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end


    def parent=(parent_node)
        # debugger
        if @parent != nil 
        old_parent = self.parent 
        old_parent.children.delete(self)
        end 


        @parent = parent_node 
        if parent_node != nil 
        @parent.children << self 
        end
    end


    def add_child(child_node)
        child_node_with_parent = child_node.parent=(self)
        
         if !@children.include?(child_node)
        @children << child_node_with_parent
        end
    end


    def remove_child(child_node)
        if @children.include?(child_node)
        child_node.parent=(nil)
        @children.delete(child_node)
        else  
            raise "Error"
        end
    end

end
