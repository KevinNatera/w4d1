require 'byebug'

class KnightPathFinder
    attr_reader :consideredPositions

    def initialize()
        @rootNode = [0,0]
        @consideredPositions = [@rootNode]
    end


    def new_move_position(pos)
        newConsideredPositions = []
            # debugger
        KnightPathFinder.valid_moves(pos).each do |move|

           if !@consideredPositions.include?(move) && !newConsideredPositions.include?(move) 
                newConsideredPositions << move
           end
       end
       @consideredPositions += newConsideredPositions
        newConsideredPositions
       
    end
    def build_move_tree(last_pos)
        #array = []
        queue = [@rootNode]
        while !queue.empty?
        queue.each do |start_move|
            queue += new_move_position(start_move)
            # array = queue[0] if 
            return start_move if queue[0] == last_pos
            
            queue.shift
        end
        end



    end


    def self.valid_moves(pos)
        x = pos[0]
        y = pos[1]

        moveArr = [[x + 2, y + 1] , [x + 1, y + 2] , [ x - 2, y - 1] , [x - 1, y - 2] ,[x - 2, y + 1] , [x - 1, y + 2] ,[x + 1, y - 2] , [x + 2 , y - 1] ] 

        moveArr
    end

    def self.build_move_tree

    end

end



k = KnightPathFinder.new 

 p k.build_move_tree([4,8])

 
