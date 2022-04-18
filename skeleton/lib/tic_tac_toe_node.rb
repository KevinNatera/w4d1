require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos
  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if self.board.over? && self.board.winner != evaluator
            # if "catgame"
            #   false 
            # else  
              true
            # end 
    elsif self.board.over?
      false
    else
    self.children.any? {|child| child.losing_node?(evaluator)}
    end
  end

  def winning_node?(evaluator)
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    
     if @next_mover_mark == :x 
      @next_mover_mark = :o 
     else 
      @next_mover_mark = :x
     end

    @board.rows.each_with_index do |row, row_index|
      row.each_with_index do |position, idx|
        #p position
        prev_mov_pos = [row_index, idx]
        if @board.rows[row_index][idx] == nil
          child =  TicTacToeNode.new(board.dup, @next_mover_mark, prev_mov_pos)
          child.board.rows[row_index][idx] = @next_mover_mark
          children << child 
        end
      end
    end
    children
  end
end
