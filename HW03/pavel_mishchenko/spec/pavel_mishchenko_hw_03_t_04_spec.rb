# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../pavel_mishchenko_hw_03_t_04'

RSpec.describe Homework3 do
  describe '#task4' do
    subject { described_class.new.task4(str) }

    context 'when argument is valid' do
      context 'when string is empty' do
        let(:str) { '' }

        it { is_expected.to eq({ digits: 0, letters: 0 }) }
      end

      context 'when string consists of letters and digits' do
        let(:str) { '012345asdfg' }

        it { is_expected.to eq({ digits: 6, letters: 5 }) }
      end

      context 'when string consists of letters,symbols and digits' do
        let(:str) { '01122333qwe_-+=}{()?<>' }

        it { is_expected.to eq({ digits: 8, letters: 3 }) }
      end
    end

    context 'when argument is invalid' do
      context 'when no argument is given' do
        subject { described_class.new.task4 }

        it 'returns ArgumentError' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end

      context 'when argument is not a String' do
        let(:str) { 404 }

        it 'returns NoMethodError' do
          expect { subject }.to raise_error(NoMethodError)
        end
      end
    end
  end
end
