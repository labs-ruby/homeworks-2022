# frozen_string_literal: true

require_relative '../maksim_manzhai_hw_03_t_04'

RSpec.describe Homework3 do
  describe '#task4' do
    subject { described_class.new.task4(input) }

    context 'when the string contains only letters' do
      let(:input) { 'qwerty' }

      it 'returns the count of letters and digits in that string' do
        expect(subject).to eql({ digits: 0, letters: 6 })
      end

      it 'returns an object of class Hash' do
        expect(subject).to be_a(Hash)
      end
    end

    context 'when the string contains only digits' do
      let(:input) { '123456' }

      it 'returns the count of letters and digits in that string' do
        expect(subject).to eql({ digits: 6, letters: 0 })
      end

      it 'returns an object of class Hash' do
        expect(subject).to be_a(Hash)
      end
    end

    context 'when the string contains digits and letters' do
      let(:input) { 'qwerty123456' }

      it 'returns the count of letters and digits in that string' do
        expect(subject).to eql({ digits: 6, letters: 6 })
      end

      it 'returns an object of class Hash' do
        expect(subject).to be_a(Hash)
      end
    end
  end
end
