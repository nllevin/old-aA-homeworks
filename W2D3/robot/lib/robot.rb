class Robot
    attr_reader :position

    def initialize
        @position = [0, 0]
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
end

class Item

end

class Bolts

end

class Weapon
end

class Laser
end

class PlasmaCannon
end