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
            # debugger
        KnightPathFinder.valid_moves(node).each do |move|

           if !@consideredPositions.include?(move.value) && !newConsideredPositions.include?(move.value) && move != node
                newConsideredPositions << move.value
           end
       end
       @consideredPositions += newConsideredPositions
       return newConsideredPositions.map{|ele| Node.new(ele)}
    end

    def build_move_tree
        #array = []
        queue = [@rootNode]
        # debugger
        while !queue.empty?
        
            start_move = queue.shift
            # debugger #queue.shift
            
            children = new_move_position(start_move)
           # debugger
            # children_with_parent = children.map {|child| child.parent = start_move}
            children.each {|child| start_move.add_child(child)}
            queue += children
            end
        end
            # if queue[0].value == [0,0]
            #     p "stopped" 
            #     return
            # end
        


            #  if queue[0].value == last_pos
            #     latest_move = queue[0]
            #     debugger
            #     while latest_move.parent != []
            #     path = [] 
            #     parent = latest_move.parent 
            #     path << parent.value 
            #     latest_move = parent
            #     end
            #    return path
            #  end
            
            
        
        def find_path(end_pos)
            # debugger
            end_pos_node = @rootNode.bfs(end_pos)
            p end_pos_node
            if end_pos_node != nil
                trace_path_back(end_pos_node).map {|node| node.value}
            else
                nil
            end
        end

        # def find_node(end_pos)
        #     arr = [@rootNode]
        #     while !arr.empty?
        #         if arr[0].value == end_pos
        #             return arr[0]
        #         end
        #         arr += arr[0].children
        #         arr.shift
        #     end
        # end

        def trace_path_back(end_pos_node)
            path = [end_pos_node]
            # p path
            # p end_pos_node
           
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



 k = KnightPathFinder.new([0,0])
 #p k.consideredPositions
#  p k.find_node([3,7]).parent
# end_node = k.find_node([3,7])
# p end_node
 p k.find_path([3,7])
 #p k.consideredPositions.length
 #p KnightPathFinder.valid_moves(Node.new([0,0]))



 
