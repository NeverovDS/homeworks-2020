require_relative 'my_module.rb'
require 'rspec'
RSpec.describe Array do
  let(:test_array) { described_class.new([1, 2, 3, 4, 5]) }
  describe '#my_each' do
    context 'when has a block' do
      it 'yields each element to the block' do
        expect do |block|
          test_array.my_each(&block)
        end.to yield_successive_args(1, 2, 3, 4, 5)
      end

      it 'will return a calculated array' do
        result = []
        test_array.my_each { |x| result << x + 3 }
        expect(result).to eq([4, 5, 6, 7, 8])
      end

      it 'returns the original array' do
        expect(test_array.my_each {}).to eq([1, 2, 3, 4, 5])
      end
    end

    context 'when empty array ' do
      let(:empty_arr) { described_class.new([]) }
      it 'returns an empty array' do
        expect(empty_arr.my_each { |x| x + 3 }).to eq([])
      end
    end
  end
end

