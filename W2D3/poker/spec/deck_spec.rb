require 'deck'

describe Deck do
    subject(:deck) { Deck.new }

    describe '#initialize' do
        it 'stores cards in an array' do
            expect(deck.cards).to be_a(Array)
        end

        it 'creates 52 cards' do
            expect(deck.cards.count).to eq(52)
        end

        it 'creates 13 cards of each suit' do
            suits = %w(C H S D)

            suits.each do |suit|
                expect(deck.cards.count { |card| card.suit == suit }).to eq(13)
            end
        end

        it 'creates 4 cards of each value' do
            (2..14).each do |value|
                expect(deck.cards.count { |card| card.value == value }).to eq(4)
            end
        end
    end

    describe '#deal_card' do
        let(:player) { double("player", :receive_card => nil) }

        it 'removes the top card from the deck' do
            expect(deck.cards).to receive(:pop)
            deck.deal_card(player)
        end

        it 'gives the card to a player' do
            expect(player).to receive(:receive_card)
            deck.deal_card(player)
        end
    end
end