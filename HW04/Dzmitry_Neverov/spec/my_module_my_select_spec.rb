require_relative 'my_module.rb'
RSpec.describe Array do
  let(:test) { described_class.new([1, 2, 3, 4, 5]) }
  describe '#my_select' do
    context 'when has a block' do
      it 'returns selected array ' do
        expect(test.my_select { |x| x < 3 }).to eq([1, 2])
      end

      it 'the result is the same as default method select' do
        expect(test.my_select { |x| x < 3 }).to eq(test.select { |x| x < 3 })
      end
    end

    context 'when has not a block' do
      it 'returns the Enumerator' do
        expect(test.my_select).to be_an_instance_of(Enumerator)
      end
    end

    context 'when empty array' do
      let(:test_empty) { described_class.new([]) }

      it 'returns an empty array' do
        expect(test_empty.my_select { |x| x < 3 }).to eq([])
      end
    end
  end
end
