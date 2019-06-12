require 'first_tdd_projects'

describe '#my_uniq' do
    let(:arr) { [1, 2, 1, 3, 3] }
    let(:uniqs) { arr.my_uniq }

    context 'when given an empty array' do
        it 'returns an empty array' do
            expect([].my_uniq).to be_empty
        end
    end

    context 'when given an array of elements' do
        it 'returns a new array' do
            expect(uniqs).to be_a(Array)
            expect(uniqs).not_to be(arr)
        end

        it 'returns unique elements in original order' do
            expect(arr.my_uniq).to eq([1, 2, 3])
        end
    end
end

describe '#two_sum' do
    context 'when given an empty array' do
        it 'returns an empty array' do
            expect([].two_sum).to be_empty
        end
    end

    context 'when no two elements sum to zero' do
        it 'returns an empty array' do
            expect([1, 2, 3, 4, 5].two_sum).to be_empty
        end
    end

    context 'when some elements sum to zero' do
        subject(:arr) { [-1, 0, 2, -2, 1] }

        it 'returns pairs of positions for elements adding to zero' do
            expect(arr.two_sum).to match_array([[2, 3], [0, 4]])
        end

        it 'is sorted "dictionary-wise"' do
            expect(arr.two_sum).to eq([[0, 4], [2, 3]])
        end
    end

end
