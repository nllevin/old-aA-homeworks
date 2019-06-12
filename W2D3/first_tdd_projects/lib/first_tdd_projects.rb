class Array
    def my_uniq
        uniqs = []
        self.each do |el|
            uniqs << el unless uniqs.include?(el)
        end
        uniqs
    end
end