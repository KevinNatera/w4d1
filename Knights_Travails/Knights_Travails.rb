# require 'byebug'
require_relative "Node"
class KnightPathFinder
    attr_reader :consideredPositions

    def initialize(pos)
        @rootNode = Node.new(pos)
        @consideredPositions = [@rootNode.value]
        build_move_tree
    end


    def new_move_position(node)
        newConsideredPositions = []
           
        KnightPathFinder.valid_moves(node).each do |move|

           if !@consideredPositions.include?(move.value) && !newConsideredPositions.include?(move.value) && move != node
                newConsideredPositions << move.value
           end
       end
       @consideredPositions += newConsideredPositions
       return newConsideredPositions.map{|ele| Node.new(ele)}
    end

    def build_move_tree
        
        queue = [@rootNode]
        
        while !queue.empty?
        
            start_move = queue.shift
            children = new_move_position(start_move)
            children.each {|child| start_move.add_child(child)}
            queue += children
        end
    end
           
           
        def find_path(end_pos)
            
            end_pos_node = @rootNode.bfs(end_pos)
            p end_pos_node
            if end_pos_node != nil
                trace_path_back(end_pos_node).map {|node| node.value}
            else
                nil
            end
        end


        def trace_path_back(end_pos_node)
            path = [end_pos_node]
            
            while (path[0].parent).is_a?(Node)
                path.unshift(path[0].parent)
            end
            path
        end


    def self.valid_moves(node)
        x = node.value[0]
        y = node.value[1]

        moveArr = [[x + 2, y + 1] , [x + 1, y + 2] , [ x - 2, y - 1] , [x - 1, y - 2] ,[x - 2, y + 1] , [x - 1, y + 2] ,[x + 1, y - 2] , [x + 2 , y - 1] ] 
        moveArr.select! { |move| move[0] >= 0 && move[0] < 8 && move[1] >= 0 && move[1] < 8}
        moveArr.map {|move| Node.new(move)}
    end

  
end




 
