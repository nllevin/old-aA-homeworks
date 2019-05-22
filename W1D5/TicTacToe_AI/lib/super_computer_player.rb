require_relative 'tic_tac_toe_node'

class SuperComputerPlayer < ComputerPlayer
  def move(game, mark)
    node = TicTacToeNode.new(game.board, mark)
    child_nodes = node.children

    winning_child_nodes = child_nodes.select { |child| child.winning_node?(mark) }
    return winning_child_nodes.sample.prev_move_pos unless winning_child_nodes.empty?
    
    non_losing_child_nodes = child_nodes.reject { |child| child.losing_node?(mark) }
    return non_losing_child_nodes.sample.prev_move_pos unless non_losing_child_nodes.empty?

    raise "Something went wrong: computer should always be able to force a draw."
  end
end

if __FILE__ == $PROGRAM_NAME
  puts "Play the brilliant computer!"
  hp = HumanPlayer.new("Jeff")
  cp = SuperComputerPlayer.new

  TicTacToe.new(hp, cp).run
end
