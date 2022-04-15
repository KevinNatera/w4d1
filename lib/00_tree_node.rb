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




end
