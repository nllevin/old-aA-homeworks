class Card
    attr_reader :value, :suit

    def initialize(value, suit)
        @value, @suit = value, suit
    end

    def to_s
        value_str = ""

        if value.between?(2, 10)
            value_str = value.to_s
        else
            case value
            when 11
                value_str = "J"
            when 12
                value_str = "Q"
            when 13
                value_str = "K"
            when 14
                value_str = "A"
            end
        end

        value_str + suit
    end
end