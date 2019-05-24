class Employee
    attr_reader :name, :title, :salary, :boss

    def initialize(name, title, salary, boss)
        @name, @title, @salary, @boss =
            name, title, salary, boss
    end

    def bonus(multiplier)
        @salary * multiplier
    end
end

class Manager < Employee
    attr_accessor :subordinates

    def initialize(name, title, salary, boss, subordinates)
        super(name, title, salary, boss)
        @subordinates = subordinates
    end

    def bonus(multiplier)
        self.sum_subordinate_salaries * multiplier
    end

    def sum_subordinate_salaries
        total_subordinate_salary = 0
        @subordinates.each do |subordinate|
            total_subordinate_salary += subordinate.salary
            total_subordinate_salary += subordinate.sum_subordinate_salaries if subordinate.is_a?(Manager)
        end
        total_subordinate_salary
    end
end