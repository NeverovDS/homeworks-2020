require_relative 'my_module.rb'
# rubocop:disable Metrics/BlockLength
RSpec.describe Array do
  let(:test_arr) { described_class.new([1, 2, 3, 4, 5]) }
  let(:empty_arr) { described_class.new([]) }

  describe '#my_map' do
    context 'when has a block' do
      it 'returns a calculated array' do
        expect(test_arr.my_map { |x| x + 3 }).to eq([4, 5, 6, 7, 8])
      end

      it 'returns the same result as default method map' do
        expect(test_arr.my_map { |x| x + 3 }).to eq(test_arr.map { |x| x + 3 })
      end
    end

    context 'when has not a block' do
      it 'returns the Enumerator' do
        expect(test_arr.my_map).to be_an_instance_of(Enumerator)
      end
    end

    context 'when empty array' do
      it 'returns an empty array' do
        expect(empty_arr.my_map { |x| x + 3 }).to eq([])
      end
    end
  end
  # rubocop:enable Metrics/BlockLength

  describe '#my_each' do
    context 'when has a block' do
      it 'yields each element to the block' do
        expect do |block|
          test_arr.my_each(&block)
        end.to yield_successive_args(1, 2, 3, 4, 5)
      end

      it 'returns a calculated array' do
        result = []
        test_arr.my_each { |x| result << x + 3 }
        expect(result).to eq([4, 5, 6, 7, 8])
      end

      it 'returns the original array' do
        expect(test_arr.my_each {}).to eq([1, 2, 3, 4, 5])
      end
    end

    context 'when empty array ' do
      let(:empty_arr) { described_class.new([]) }

      it 'returns an empty array' do
        expect(empty_arr.my_each { |x| x + 3 }).to eq([])
      end
    end
  end

  # rubocop:disable Layout/LineLength

  describe '#my_select' do
    context 'when has a block' do
      it 'returns selected array ' do
        expect(test_arr.my_select { |x| x < 3 }).to eq([1, 2])
      end

      it 'returns the same result as default method select' do
        expect(test_arr.my_select { |x| x < 3 }).to eq(test_arr.select { |x| x < 3 })
      end
    end

    context 'when has not a block' do
      it 'returns the Enumerator' do
        expect(test_arr.my_select).to be_an_instance_of(Enumerator)
      end
    end

    # rubocop:enable Layout/LineLength

    context 'when empty array' do
      let(:test_empty) { described_class.new([]) }

      it 'returns an empty array' do
        expect(test_empty.my_select { |x| x < 3 }).to eq([])
      end
    end
  end
end
