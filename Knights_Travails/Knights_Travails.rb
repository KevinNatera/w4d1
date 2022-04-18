#require 'byebug'
require_relative "Node"
class KnightPathFinder
    attr_reader :consideredPositions

    def initialize()
        @rootNode = Node.new([0,0])
        @consideredPositions = [@rootNode]
    end


    def new_move_position(node)
        newConsideredPositions = []
            # debugger
        KnightPathFinder.valid_moves(node).each do |move|

           if !@consideredPositions.include?(move.value) && !newConsideredPositions.include?(move.value) 
                newConsideredPositions << move.value
           end
       end
       @consideredPositions += newConsideredPositions
        newConsideredPositions.map{|ele| Node.new(ele)}
       
    end
    def build_move_tree(last_pos)
        #array = []
        queue = [@rootNode]
        while !queue.empty?
        queue.each do |start_move|
            puts start_move.value
            puts 
            children = new_move_position(start_move)
            p children
            children.map! {|child| child.parent=start_move}
            children.each {|child| start_move.add_child(child)}
            queue += children
            
            # array = queue[0] if 
            return start_move if queue[0].value == last_pos
            
            queue.shift
        end
        end



    end


    def self.valid_moves(node)
        x = node.value[0]
        y = node.value[1]

        moveArr = [[x + 2, y + 1] , [x + 1, y + 2] , [ x - 2, y - 1] , [x - 1, y - 2] ,[x - 2, y + 1] , [x - 1, y + 2] ,[x + 1, y - 2] , [x + 2 , y - 1] ] 

        moveArr.map {|move| Node.new(move)}
    end

    def self.build_move_tree

    end

end



k = KnightPathFinder.new 

 p k.build_move_tree([4,8])

 
