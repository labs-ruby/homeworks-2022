RSpec.describe Mentor do
  subject(:create) { described_class.new(name: 'Sam', surname: 'Smith') }

  describe '#initialize' do
    context 'when no arguments are given' do
      it 'returns an error' do
        expect { described_class.new }.to raise_error(ArgumentError)
      end
    end
  end

  describe '#homeworks' do
    context 'when no arguments are given' do
      it 'returns nil' do
        expect(described_class.new).to be_nil
      end
    end
  end
end