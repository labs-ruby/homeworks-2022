# frozen_string_literal: true

require_relative '../andrey_shynkarou_hw_03_t_04'

RSpec.describe Homework3 do
  let(:obj) { Object.const_get('Homework3').new }

  describe '#task4' do
    context 'when counter of letters and digits in the string' do
      context 'when word consists letters and digits' do
        it 'returns number of letters and digits' do
          expect(obj.task4('12345qwert')).to eq({ digits: 5, letters: 5 })
        end
      end

      context 'when word consists of letters, symbols and digits' do
        it 'returns number of letters and digits' do
          expect(obj.task4('123_45q-+./,wert')).to eq({ digits: 5, letters: 5 })
        end
      end

      context 'when word is empty' do
        it 'returns number of letters=0 and digits=0' do
          expect(obj.task4('')).to eq({ digits: 0, letters: 0 })
        end
      end

      context 'when no arguments are given' do
        it 'returns ArgumentError' do
          expect { obj.task4 }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
