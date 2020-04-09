require 'rspec'
require 'my_module.rb'

describe 'my_each' do
  let(:a) { Array.new([1, 2, 3, 4, 5]) }
  let(:result) { [] }

  context 'has a block' do
    it 'yields each element to the block' do
      expect do |block|
        a.my_each(&block)
      end.to yield_successive_args(1, 2, 3, 4, 5)
    end
    it 'will return a calculated array' do
      result = []
      a.my_each { |x| result << x + 3 }
      expect(result).to eq([4, 5, 6, 7, 8])
    end

    it 'returns the original array' do
      expect(a.my_each {}).to eq([1, 2, 3, 4, 5])
    end
  end

  context 'has not a block' do
    it 'returns the Enumerator' do
      expect(a.my_each).to be_an_instance_of(Enumerator)
    end
  end
end
describe 'my_map' do
  let(:a) { Array.new([1, 2, 3, 4, 5]) }
  context 'has a block' do
    it 'will return a calculated array' do
      expect(a.my_map { |x| x + 3 }).to eq([4, 5, 6, 7, 8])
    end

    it 'the result is the same as default method map' do
      expect(a.my_map { |x| x + 3 }).to eq(a.map { |x| x + 3 })
    end
  end
  context 'has not a block' do
    it 'returns the Enumerator' do
      expect(a.my_map).to be_an_instance_of(Enumerator)
    end
  end
  context 'empty array' do
    let(:a) { Array.new([]) }
    it 'returns an empty array' do
      expect(a.my_map { |x| x + 3 }).to eq([])
    end
  end
end
describe 'my_select' do
  let(:a) { Array.new([1, 2, 3, 4, 5]) }
  context 'has a block' do
    it 'returns selected array ' do
      expect(a.my_select { |x| x < 3 }).to eq([1, 2])
    end
    it 'the result is the same as default method select' do
      expect(a.my_select { |x| x < 3 }).to eq(a.select { |x| x < 3 })
    end
  end
  context 'has not a block' do
    it 'returns the Enumerator' do
      expect(a.my_select).to be_an_instance_of(Enumerator)
    end
  end
  context 'empty array' do
    let(:a) { Array.new([]) }
    it 'returns an empty array' do
      expect(a.my_select { |x| x < 3 }).to eq([])
    end
  end
end
