# frozen_string_literal: true

RSpec.describe Homework3 do
  subject { described_class.new }

  describe 'task 4' do
    context 'when log is array' do
      it 'returns { letters: 0, digits: 0 }' do
        expect(subject.task4([])).to eq({ letters: 0, digits: 0 })
      end
    end

    context 'when log is hash' do
      it 'returns { letters: 0, digits: 0 }' do
        expect(subject.task4({})).to eq({ letters: 0, digits: 0 })
      end
    end

    context 'when log is nil' do
      it 'returns { letters: 0, digits: 0 }' do
        expect(subject.task4(nil)).to eq({ letters: 0, digits: 0 })
      end
    end

    context 'when log is number' do
      it 'returns { letters: 0, digits: 0 }' do
        expect(subject.task4(1)).to eq({ letters: 0, digits: 0 })
      end
    end
  end
end
