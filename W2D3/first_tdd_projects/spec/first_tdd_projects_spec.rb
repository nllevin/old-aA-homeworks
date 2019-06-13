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

    describe '#my_transpose' do
        context 'when given an empty array' do
            it 'returns an empty array' do
                expect([].my_transpose).to be_empty
            end
        end

        context 'when given an array of matrix rows' do
            let(:arr) { [[0, 1, 2], [3, 4, 5], [6, 7, 8]] }
            let(:transposed) { arr.my_transpose }

            it 'returns a new array' do
                expect(transposed).to be_a(Array)
                expect(transposed).not_to be(arr)
            end

            it 'exchanges rows and columns' do
                expect(transposed).to eq([[0, 3, 6], [1, 4, 7], [2, 5, 8]])
            end
        end
    end
end

describe '#stock_picker' do
    let(:stock_prices) { [100, 75, 125, 250, 200, 300, 10] }

    context 'when stock only drops' do
        it 'returns [0,0]' do
            expect(stock_picker([10, 9, 8, 7, 6])).to eq([0,0])
        end
    end
    
    context 'when stock goes up and down' do
        it 'returns most profitable pair of days to buy/sell' do
            expect(stock_picker(stock_prices)).to eq([1, 5])
        end
    end
end

describe TowersOfHanoi do
    let(:game) { TowersOfHanoi.new(8) }

    describe '#initialize' do
        it 'starts with all disks on the left stack' do
            expect(game.stacks[0]).to eq([8, 7, 6, 5, 4, 3, 2, 1])
            expect(game.stacks[1]).to eq([])
            expect(game.stacks[2]).to eq([])
        end
    end

    describe '#move' do
        context 'when user inputs invalid start or end stack' do
            it 'raises the appropriate error' do
                expect { game.move("blue", "r") }.to raise_error("Please enter valid stacks (l/c/r).")
                expect { game.move("1", "2") }.to raise_error("Please enter valid stacks (l/c/r).")
                expect { game.move("l", "red") }.to raise_error("Please enter valid stacks (l/c/r).")
            end
        end

        context 'when start stack is empty' do
            it 'raises the appropriate error' do
                expect { game.move("c", "r") }.to raise_error("Start stack has no disks to move.")
                expect { game.move("r", "l") }.to raise_error("Start stack has no disks to move.")
            end
        end

        context 'when start and end stacks are the same' do
            it 'raises the appropriate error' do
                expect { game.move("l", "l") }.to raise_error("You must move to a different stack.")
            end
        end

        context 'when user moves larger disk onto smaller' do
            it 'raises the appropriate error' do
                game.stacks[0], game.stacks[1] = [8, 7, 6, 5, 4, 3, 2], [1]

                expect { game.move("l", "c") }.to raise_error("You cannot move a larger disk onto a smaller disk.")
            end
        end

        context 'when user moves disk onto empty stack' do
            before(:each) do 
                game.move("l", "c")
                game.move("l", "r")
            end

            it 'removes the top disk from start stack' do
                expect(game.stacks[0]).to eq([8, 7, 6, 5, 4, 3])
            end

            it 'places that disk on the empty stack' do
                expect(game.stacks[1]).to eq([1])
                expect(game.stacks[2]).to eq([2])
            end
        end

        context 'when user moves smaller disk onto larger disk' do
            before(:each) do
                game.stacks[0], game.stacks[1], game.stacks[2] =
                    [8, 7, 6, 5, 4, 3], [2, 1], []
                game.move("c", "l")
            end

            it 'removes the top disk from start stack' do
                expect(game.stacks[1]).to eq([2]) 
            end

            it 'places that disk on the smaller disk' do
                expect(game.stacks[0]).to eq([8, 7, 6, 5, 4, 3, 1])
            end
        end
    end

    describe '#won?' do
        context 'when disks remain on left/center stacks' do
            it 'returns false' do
                expect(game.won?).to be false

                game.stacks[0], game.stacks[1] = game.stacks[1], game.stacks[0]
                expect(game.won?).to be false
            end
        end

        context 'when all disks are on the right stack' do
            it 'returns true' do
                game.stacks[0], game.stacks[2] = game.stacks[2], game.stacks[0]
                expect(game.won?).to be true
            end
        end
    end
end