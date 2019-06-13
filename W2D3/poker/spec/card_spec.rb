require 'card'

describe Card do
    subject(:jack_of_clubs) { Card.new(11, "C") }

    describe '#initialize' do
        it 'assigns a value' do
            expect(jack_of_clubs.value).to eq(11)
        end

        it 'assigns a suit' do
            expect(jack_of_clubs.suit).to eq("C")
        end
    end

    describe '#to_s' do
        context 'for numerical cards' do
            let(:two_of_hearts) { Card.new(2, "H") }

            it 'returns a string containing value and suit' do
                expect(two_of_hearts.to_s).to eq("2H")
            end
        end

        context 'for face cards' do
            let(:ace_of_spades) { Card.new(14, "S") }
            let(:king_of_diamonds) { Card.new(13, "D") }
            let(:queen_of_hearts) { Card.new(12, "H") }
            let(:jack_of_clubs) { Card.new(11, "C") }

            it 'returns a string containing face value and suit' do
                expect(ace_of_spades.to_s).to eq("AS")
                expect(king_of_diamonds.to_s).to eq("KD")
                expect(queen_of_hearts.to_s).to eq("QH")
                expect(jack_of_clubs.to_s).to eq("JC")
            end
        end
    end
end