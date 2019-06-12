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