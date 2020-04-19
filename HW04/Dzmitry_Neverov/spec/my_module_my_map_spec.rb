require_relative 'my_module.rb'
RSpec.describe Array do
  let(:test_arr) { described_class.new([1, 2, 3, 4, 5]) }
  let(:empty_arr) { described_class.new([]) }
  describe '#my_map' do
    context 'when has a block' do
      it 'will return a calculated array' do
        expect(test_arr.my_map { |x| x + 3 }).to eq([4, 5, 6, 7, 8])
      end

      it 'the result is the same as default method map' do
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
end
