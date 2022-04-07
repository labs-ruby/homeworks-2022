# frozen_string_literal: true

require_relative '../tim_bulat_hw_03_t_04'

RSpec.describe Homework3 do
  describe '#task4' do
    context 'when empty string' do
      subject { described_class.new.task4('') }

      it 'expcet to return hash' do
        expect(subject).to be_a(Hash)
      end

      it 'expcet to return hash with 0s' do
        expect(subject).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when string with only letters' do
      subject { described_class.new.task4('Q wer ty##@!') }

      it 'expcet to return hash' do
        expect(subject).to be_a(Hash)
      end

      it 'expcet to return hash with amount of letters' do
        expect(subject).to eq({ digits: 0, letters: 6 })
      end
    end

    context 'when string with only digits' do
      subject { described_class.new.task4('1 2 3456!#@$ ') }

      it 'expcet to return hash' do
        expect(subject).to be_a(Hash)
      end

      it 'expcet to return hash with amount of digits' do
        expect(subject).to eq({ digits: 6, letters: 0 })
      end
    end

    context 'when string with letters and digits' do
      subject { described_class.new.task4('qWeRty 1 2 3456!#@$ ') }

      it 'expcet to return hash' do
        expect(subject).to be_a(Hash)
      end

      it 'expcet to return hash with amount of digits and letters' do
        expect(subject).to eq({ digits: 6, letters: 6 })
      end
    end
  end
end
