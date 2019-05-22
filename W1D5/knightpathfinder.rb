require "./PolyTreeNode/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :considered_positions
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
    end

    def self.valid_moves(pos)
        valids = []
        x, y = pos
        deltas = [
            [1, 2],
            [2, 1],
            [2, -1],
            [1, -2],
            [-1, -2],
            [-2, -1],
            [-2, 1],
            [-1, 2]
        ]
        deltas.each do |dx, dy|
            valids << [x+dx, y+dy] if (x+dx).between?(0,8) && (y+dy).between?(0,8)
        end
        valids
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos).reject { |valid_move| @considered_positions.include?(valid_move) }
        @considered_positions.concat(new_moves)
        new_moves
    end
end