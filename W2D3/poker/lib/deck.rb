require_relative 'card'

class Deck
    attr_reader :cards

    def initialize
        @cards = []

        suits = %w(C D S H)
        suits.each do |suit|
            (2..14).each { |value| @cards << Card.new(value, suit) }
        end
    end

    def deal_card(player)
        player.receive_card(@cards.pop)
    end
end