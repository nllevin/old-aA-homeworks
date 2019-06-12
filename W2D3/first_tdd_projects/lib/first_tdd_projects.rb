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