require_relative 'tic_tac_toe'

class TicTacToeNode
  attr_reader :board, :next_mover_mark, :prev_move_pos

  def initialize(board, next_mover_mark, prev_move_pos = nil)
    @board = board
    @next_mover_mark = next_mover_mark
    @prev_move_pos = prev_move_pos
  end

  def losing_node?(evaluator)
    if @board.over?
      return false if @board.tied? || @board.winner == evaluator
      return true
    end
    if evaluator == @next_mover_mark 
      return true if self.children.all? { |child| child.losing_node?(evaluator) }
    else
      return true if self.children.any? { |child| child.losing_node?(evaluator) }
    end
    false
  end

  def winning_node?(evaluator)
    if @board.over?
      return true if @board.winner == evaluator
      return false
    end
    if evaluator == @next_mover_mark 
      return true if self.children.any? { |child| child.winning_node?(evaluator) }
    else
      return true if self.children.all? { |child| child.winning_node?(evaluator) }
    end
    false
  end

  # This method generates an array of all moves that can be made after
  # the current move.
  def children
    children = []
    next_next_mover_mark = [:x, :o].reject { |mark| mark == next_mover_mark }.first

    @board.rows.each_with_index do |row, row_idx|
      row.each_with_index do |square, col_idx|
        pos = [row_idx, col_idx]
        if @board.empty?(pos)
          child_board = @board.dup
          child_board[pos] = @next_mover_mark
          children << TicTacToeNode.new(child_board, next_next_mover_mark, pos)
        end
      end
    end
    children
  end
end
