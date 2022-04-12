# frozen_string_literal: true

require_relative '../tim_bulat_hw_03_t_04'

RSpec.describe Homework3 do
  describe '#task4' do
    subject { described_class.new.task4(string) }

    context 'when empty string' do
      let(:string) { '' }

      it 'returns Hash' do
        expect(subject).to be_a(Hash)
      end

      it 'returns Hash with 0s' do
        expect(subject).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when string with only letters' do
      let(:string) { 'Q wer ty##@!' }

      it 'returns Hash' do
        expect(subject).to be_a(Hash)
      end

      it 'returns Hash with amount of letters' do
        expect(subject).to eq({ digits: 0, letters: 6 })
      end
    end

    context 'when string with only digits' do
      let(:string) { '1 2 3456!#@$ ' }

      it 'returns Hash' do
        expect(subject).to be_a(Hash)
      end

      it 'returns Hash with amount of digits' do
        expect(subject).to eq({ digits: 6, letters: 0 })
      end
    end

    context 'when string with letters and digits' do
      let(:string) { 'qWeRty 1 2 3456!#@$ ' }

      it 'returns Hash' do
        expect(subject).to be_a(Hash)
      end

      it 'returns Hash with amount of digits and letters' do
        expect(subject).to eq({ digits: 6, letters: 6 })
      end
    end
  end
end
