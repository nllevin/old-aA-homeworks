class Robot
    attr_reader :position, :items, :health
    attr_accessor :equipped_weapon

    def initialize
        @position, @items, @health = [0, 0], [], 100, nil
    end

    def move_left
        @position = [ @position[0] - 1, @position[1] ]
    end

    def move_right
        @position = [ @position[0] + 1, @position[1] ]
    end

    def move_up
        @position = [ @position[0], @position[1] + 1 ]
    end

    def move_down
        @position = [ @position[0], @position[1] - 1 ]
    end

    def pick_up(item)
        if items_weight + item.weight <= 250
            @items << item 
        else
            raise ArgumentError
        end
    end

    def items_weight
        @items.empty? ? 0 : @items.map(&:weight).sum
    end

    def wound(amount)
        @health -= amount
        @health = 0 if @health < 0
    end

    def heal(amount)
        @health += amount
        @health = 100 if @health > 100
    end

    def attack(other_robot)
        if @equipped_weapon.nil? 
            other_robot.wound(5)
        else
            @equipped_weapon.hit(other_robot)
        end
    end
end

class Item
    attr_reader :name, :weight

    def initialize(name, weight)
        @name, @weight = name, weight
    end
end

class Bolts < Item
    def initialize
        super("bolts", 25)
    end

    def feed(robot)
        robot.heal(25)
    end
end

class Weapon < Item
    attr_reader :damage

    def initialize(name, weight, damage)
        @damage = damage
        super(name, weight)
    end

    def hit(robot)
        robot.wound(damage)
    end
end

class Laser < Weapon
    def initialize
        super("laser", 125, 25)
    end
end

class PlasmaCannon < Weapon
    def initialize
        super("plasma_cannon", 200, 55)
    end
end