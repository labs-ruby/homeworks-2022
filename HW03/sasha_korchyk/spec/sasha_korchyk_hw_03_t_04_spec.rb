# frozen_string_literal: true

require './sasha_korchyk_hw_03_t_04'

describe Homework3 do
  describe '#task4' do
    context 'with input' do
      let(:string) { 'asdfs5645adfad456' }

      it 'returns hash with amount of letters and digits from string' do
        expect(subject.task4(string)).to eq(digits: 7, letters: 10)
      end
    end

    context 'without input' do
      it 'returns hash with 0 values' do
        expect(subject.task4('')).to eq(digits: 0, letters: 0)
      end
    end
  end
end
