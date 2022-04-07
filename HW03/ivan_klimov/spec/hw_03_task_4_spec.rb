# frozen_string_literal: true

require_relative '../ivan_klimov_hw_03_t_04'

RSpec.describe Homework3 do
  subject { described_class.new }

  describe '#task4' do
    context 'when string is empty' do
      let(:logs) { '' }

      it 'returns hash with 0' do
        expect(subject.task4(logs)).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when string incorporates only symbols' do
      let(:logs) { '____.' }

      it 'returns hash with 0' do
        expect(subject.task4(logs)).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when string incorporates only digits' do
      let(:logs) { '12347' }

      it 'returns hash with amount of numbers' do
        expect(subject.task4(logs)).to eq({ digits: 5, letters: 0 })
      end
    end

    context 'when string incorporates only letters' do
      let(:logs) { 'five' }

      it 'returns hash with amount of numbers' do
        expect(subject.task4(logs)).to eq({ digits: 0, letters: 4 })
      end
    end

    context 'when string incorporates letters and digits' do
      let(:logs) { 'five5' }

      it 'returns hash with amount of numbers' do
        expect(subject.task4(logs)).to eq({ digits: 1, letters: 4 })
      end
    end
  end
end
