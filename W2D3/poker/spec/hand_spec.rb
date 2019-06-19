require 'hand'

describe Hand do
    describe '#initialize' do
        it 'initializes with an empty array of cards'
    end

    describe '#receive_card' do
        it 'adds the card to the hand'
    end

    describe '#discard' do
        it 'removes the card from the hand'
    end

    describe '#category' do
        it 'returns a symbol'

        it 'identifies a straight flush'

        it 'identifies four of a kind'

        it 'identifies a full house'

        it 'identifies a flush'

        it 'identifies a straight'

        it 'identifies three of a kind'

        it 'identifies two pairs'

        it 'identifies one pair'

        it 'identifies a high card'

    end

    describe '#compare' do
        it 'checks the category of each hand'

        context 'when each hand belongs to a different category' do
            it 'returns the better hand'
        end

        context 'when both hands belong to the same category' do
            it 'calls #compare_card_values'

            it 'passes the category to #compare_card_values'

            it 'passes both hands to #compare_card_values'

            it 'returns the better hand'

        end
    end

    describe '#compare_card_values' do
        context 'straight flushes' do
            it 'compares the highest card values'

            it 'correctly handles five-high straights'
        end

        context 'four of a kind' do
            it 'compares the four-of-a-kind card values'
        end
        
        context 'full houses' do
            it 'compares the card values of the triplets'
        end

        context 'flushes' do
            it 'compares the highest card values'
        end

        context 'straights' do
            it 'compares the highest card values'

            it 'correctly handles five-high straights'
        end

        context 'three of a kind' do
            it 'compares the three-of-a-kind card values'
        end

        context 'two pairs' do
            context 'when each hand has the same two pairs' do
                it 'compares the fifth card values'
            end

            context 'when each hand has only the same top pair' do
                it 'compares the lower paired card values'
            end

            context 'otherwise' do
                it 'compares the higher paired card values'
            end
        end

        context 'one pair' do
            context 'when each hand has the same pair' do
                it 'compares the highest remaining card values'
            end
            
            context 'otherwise' do
                it 'compares the paired card values'
            end
        end

        context 'high card' do
            it 'compares the highest card values'
        end
    end
end