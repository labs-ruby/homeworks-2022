# frozen_string_literal: true

RSpec.describe 'Homework3' do
  let(:obj) { Object.const_get(:Homework3).new }

  describe '::right format argument is given' do
    context 'when string is given has only letters' do
      it 'returns hash with contains digits, letters' do
        expect(obj.task4('hel2!lo')).to eq({ digits: 1, letters: 5 })
      end
    end

    context 'when string is given has letters and special symbols' do
      it 'returns hash contains zero digits and positive number of letters' do
        expect(obj.task4('wicked .. !')).to eq({ digits: 0, letters: 6 })
      end
    end

    context 'when an empty string is given' do
      it 'returns hash contains zero amount of digits, letters' do
        expect(obj.task4('')).to eq({ digits: 0, letters: 0 })
      end
    end
  end

  describe '::wrong format argument is given' do
    context 'when no arguments is given' do
      it 'returns ArgumentError' do
        expect { obj.task4 }.to raise_error(ArgumentError)
      end
    end
  end
end
