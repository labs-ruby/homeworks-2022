# frozen_string_literal: true

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  describe 'task 3' do
    context 'when text wrong' do
      it 'returns "0"' do
        expect(obj.task3('sadhfksjadfhksahdf')).to eq('0')
      end
    end

    context 'when log is array' do
      it 'returns "0"' do
        expect(obj.task3([])).to eq('0')
      end
    end

    context 'when log is hash' do
      it 'returns "0"' do
        expect(obj.task3({})).to eq('0')
      end
    end

    context 'when log is nil' do
      it 'returns "0"' do
        expect(obj.task3(nil)).to eq('0')
      end
    end

    context 'when log is number' do
      it 'returns "0"' do
        expect(obj.task3(1)).to eq('0')
      end
    end
  end
end
