require './lib/asymm.rb'

RSpec.describe 'overlap method' do
  context 'when overlapping exists' do
    it 'returns overlapping ranges of 3 ranges' do
      array = [[1, 4], [2, 5], [4, 8]]
      expect(overlap(array)).to eq([[1, 8]])
    end

    it 'returns overlapping ranges of 2 ranges' do
      array = [[1, 4], [4, 6]]
      expect(overlap(array)).to eq([[1, 6]])
    end

    it 'returns 1 range when various equal ranges are in' do
      array = [[1, 1], [1, 1], [1, 1], [1, 1], [1, 1]]
      expect(overlap(array)).to eq([[1, 1]])
    end

    it 'returns overlapping ranges of consecutive ranges' do
      array = [[1, 2], [2, 3], [3, 10]]
      expect(overlap(array)).to eq([[1, 10]])
    end

    it 'return 1 overlap from 100 overlapping ranges' do
      array = []
      subary = []
      (1..100).each_with_index do |num, i|
        if num%2 == 0
          subary << num + 1
          array << subary
          subary = []
        else
          subary << num
        end
      end
      expect(overlap(array)).to eq([[1, 101]])
    end

    it 'returns overlapping ranges with 1 wide range of 3' do
      array = [[1,3],[4,10],[5,7]]
      expect(overlap(array)).to eq([[1,3],[4,10]])
    end

    it 'returns overlapping ranges with 1 wide range of 4' do
      array = [[1,3],[2,4],[5,10],[6,7]]
      expect(overlap(array)).to eq([[1,4],[5,10]])
    end
  end

  context 'when no overlapping exists' do
    it 'returns itself with 2 ranges' do
      array = [[1, 2], [3, 4]]
      expect(overlap(array)).to eq(array)
    end

    it 'returns and empty array' do
      expect(overlap([[]])).to eq([[]])
    end

    it 'returns itself with 100 ranges' do
      array = []
      subary = []
      (1..100).each_with_index do |num, i|
        if num%2 == 0
          subary << num
          array << subary
          subary = []
        else
          subary << num
        end
      end
      expect(overlap(array)).to eq(array)
    end
  end

  context 'when mixing overlapping ranges with non-overlapping' do
    it 'returns merged ranges when first ones overlap' do
      array = [[1,6],[5,6],[10,13],[15,22]]
      expect(overlap(array)).to eq([[1,6],[10,13],[15,22]])
    end

    it 'returns merged ranges when last ones overlap' do
      array = [[1,6],[7,11],[10,22],[11,15]]
      expect(overlap(array)).to eq([[1,6],[7,22]])
    end
  end
end
