# frozen_string_literal: true

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  describe 'task 2' do
    context 'when text wrong' do
      it 'returns an  empty array' do
        expect(obj.task2('sadhfksjadfhksahdf')).to eq([])
      end
    end

    context 'when log is array' do
      it 'returns an empty array' do
        expect(obj.task2([])).to eq([])
      end
    end

    context 'when log is hash' do
      it 'returns an emrpty array' do
        expect(obj.task2({})).to eq([])
      end
    end

    context 'when log is nil' do
      it 'returns an empty array' do
        expect(obj.task2(nil)).to eq([])
      end
    end

    context 'when log is number' do
      it 'returns an empty array' do
        expect(obj.task2(1)).to eq([])
      end
    end
  end
end
