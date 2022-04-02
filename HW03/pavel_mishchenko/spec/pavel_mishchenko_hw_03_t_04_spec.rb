# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../pavel_mishchenko_hw_03_t_04'

RSpec.describe Homework3 do
  subject { described_class.new.task4(str) }

  describe 'counter of letters and digits in the string' do
    context 'when word consists letters and digits' do
      let(:str) { '012345asdfg' }

      it 'returns number of letters and digits' do
        expect(subject).to eq({ digits: 6, letters: 5 })
      end
    end

    context 'when string is empty' do
      let(:str) { '' }

      it 'returns hash with 0 values' do
        expect(subject).to eq({ digits: 0, letters: 0 })
      end
    end

    context 'when string contains not only numbers and letters' do
      let(:str) { '01122333qwe_-+=}{()?<>' }

      it 'returns number of letters and digits' do
        expect(subject).to eq({ digits: 8, letters: 3 })
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
