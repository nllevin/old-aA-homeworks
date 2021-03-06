require "./PolyTreeNode/lib/00_tree_node.rb"

class KnightPathFinder
    attr_reader :considered_positions
    def initialize(start_pos)
        @root_node = PolyTreeNode.new(start_pos)
        @considered_positions = [start_pos]
        @move_tree = self.build_move_tree
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
            valids << [x+dx, y+dy] if (x+dx).between?(0,7) && (y+dy).between?(0,7)
        end
        valids
    end

    def new_move_positions(pos)
        new_moves = KnightPathFinder.valid_moves(pos).reject { |valid_move| @considered_positions.include?(valid_move) }
        @considered_positions.concat(new_moves)
        new_moves
    end

    def build_move_tree
        tree = [@root_node]
        nodes_queue = [@root_node]
        until nodes_queue.empty?
            current_node = nodes_queue.shift
            self.new_move_positions(current_node.value).each do |new_pos| 
                child_node = PolyTreeNode.new(new_pos)
                child_node.parent = current_node
                nodes_queue << child_node
                tree << child_node
            end    
        end
        tree
    end

    def find_path(end_pos)
        end_node = @move_tree.select { |node| node.value == end_pos }.first
        self.trace_path_back(end_node)
    end

    def trace_path_back(end_node)
        path = []
        current_node = end_node
        until current_node == @root_node
            path << current_node.value
            current_node = current_node.parent
        end
        path << current_node.value
        path.reverse
    end
end