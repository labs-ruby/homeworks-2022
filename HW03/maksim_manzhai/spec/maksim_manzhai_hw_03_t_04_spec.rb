# frozen_string_literal: true

require_relative '../maksim_manzhai_hw_03_t_04'

RSpec.describe Homework3 do
  describe '#task4' do
    let(:homework) { described_class.new }

    context 'when the string contains only letters' do
      let(:input) do
        'qwerty'
      end

      let(:output) { { digits: 0, letters: 6 } }

      it 'returns the count of letters and digits in that string' do
        expect(homework.task4(input)).to eql output
      end

      it 'returns an object of class Hash' do
        expect(homework.task4(input)).to be_a(Hash)
      end
    end

    context 'when the string contains only digits' do
      let(:input) do
        '123456'
      end

      let(:output) { { digits: 6, letters: 0 } }

      it 'returns the count of letters and digits in that string' do
        expect(homework.task4(input)).to eql output
      end

      it 'returns an object of class Hash' do
        expect(homework.task4(input)).to be_a(Hash)
      end
    end

    context 'when the string contains digits and letters' do
      let(:input) do
        'qwerty123456'
      end

      let(:output) { { digits: 6, letters: 6 } }

      it 'returns the count of letters and digits in that string' do
        expect(homework.task4(input)).to eql output
      end

      it 'returns an object of class Hash' do
        expect(homework.task4(input)).to be_a(Hash)
      end
    end
  end
end
