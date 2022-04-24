# frozen_string_literal: true

RSpec.describe Homework3 do
  subject { described_class.new }

  describe 'task 1' do
    context 'when text wrong' do
      it 'returns an empty string' do
        expect(subject.task1('sadhfksjadfhksahdf')).to eq('')
      end
    end

    context 'when log is array' do
      it 'returns an empty string' do
        expect(subject.task1([])).to eq('')
      end
    end

    context 'when log is hash' do
      it 'returns an empty string' do
        expect(subject.task1({})).to eq('')
      end
    end

    context 'when log is nil' do
      it 'returns an empty string' do
        expect(subject.task1(nil)).to eq('')
      end
    end

    context 'when log is number' do
      it 'returns an empty string' do
        expect(subject.task1(1)).to eq('')
      end
    end
  end
end
