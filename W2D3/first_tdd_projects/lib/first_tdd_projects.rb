class Array
    def my_uniq
        uniqs = []
        self.each do |el|
            uniqs << el unless uniqs.include?(el)
        end
        uniqs
    end

    def two_sum
        zero_sums = []
        (0...self.count - 1).each do |idx_1|
            (idx_1 + 1...self.count).each do |idx_2|
                zero_sums << [idx_1, idx_2] if self[idx_1] + self[idx_2] == 0
            end
        end
        zero_sums
    end

    def my_transpose
        transposed = Array.new(self.length) { Array.new(self.length) }
        self.each_with_index do |row, row_idx|
            row.each_with_index do |el, col_idx|
                transposed[col_idx][row_idx] = el
            end
        end
        transposed
    end
end

def stock_picker(stock_prices)
    best_buy_day, best_sell_day, best_profit = 0, 0, 0
    (0...stock_prices.length - 1).each do |buy_day|
        (buy_day + 1...stock_prices.length).each do |sell_day|
            profit = stock_prices[sell_day] - stock_prices[buy_day]

            if profit > best_profit
                best_buy_day, best_sell_day, best_profit =
                    buy_day, sell_day, profit
            end
        end
    end
    [best_buy_day, best_sell_day]
end

class TowersOfHanoi
    STACKS = {
        "l" => 0,
        "c" => 1,
        "r" => 2
    }
    attr_accessor :stacks

    def initialize(num_disks)
        @stacks = [num_disks.downto(1).to_a, [], []]
    end

    def play
        until won?
            render
            puts "What stack will you move from? (l/c/r)"
            start_stack = gets.chomp.to_s.downcase
            puts "To what stack will you move? (l/c/r)"
            end_stack = gets.chomp.to_s.downcase

            begin
                move(start_stack, end_stack)
            rescue StandardError => e
                puts e.message
            end
            
            puts
            puts "***********************"
            puts
        end
        render
        puts "You won!"
    end

    def render
        puts "Left stack: #{@stacks[0]}"
        puts "Center stack: #{@stacks[1]}"
        puts "Right stack: #{@stacks[2]}"
    end

    def move(start_stack, end_stack)
        unless STACKS.keys.include?(start_stack) && STACKS.keys.include?(end_stack)
            raise "Please enter valid stacks (l/c/r)."
        end

        start_num, end_num = STACKS[start_stack], STACKS[end_stack]

        raise "Start stack has no disks to move." if @stacks[start_num].empty?
        raise "You must move to a different stack." if start_num == end_num
        if !@stacks[end_num].empty? && @stacks[start_num].last > @stacks[end_num].last
            raise "You cannot move a larger disk onto a smaller disk."
        end

        @stacks[end_num].push(@stacks[start_num].pop)
    end

    def won?
        @stacks[0].empty? && @stacks[1].empty?
    end
end