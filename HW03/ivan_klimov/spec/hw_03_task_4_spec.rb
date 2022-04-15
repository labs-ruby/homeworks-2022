# frozen_string_literal: true

require_relative '../ivan_klimov_hw_03_t_04'

RSpec.describe Homework3 do
  subject { described_class.new.task4(logs) }

  describe '#task4' do
    context 'when logs are empty' do
      let(:logs) { '' }

      it 'returns hash with digits=>0 and letters=>0' do
        expect(subject).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when logs incorporate only symbols' do
      let(:logs) { '____.' }

      it 'returns hash with digits=>0 and letters=>0' do
        expect(subject).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when logs incorporate only digits' do
      let(:logs) { '12347' }

      it 'returns hash with digits=>5 and letters=>0' do
        expect(subject).to eq({ digits: 5, letters: 0 })
      end
    end

    context 'when logs incorporate only letters' do
      let(:logs) { 'five' }

      it 'returns hash with digits=>0 and letters=>4' do
        expect(subject).to eq({ digits: 0, letters: 4 })
      end
    end

    context 'when logs incorporate letters and digits' do
      let(:logs) { 'five5' }

      it 'returns hash with digits=>1 and letters=>4' do
        expect(subject).to eq({ digits: 1, letters: 4 })
      end
    end
  end
end
