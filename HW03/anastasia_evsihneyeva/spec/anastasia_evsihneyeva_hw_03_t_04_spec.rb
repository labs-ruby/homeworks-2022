# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/spec/spec_helper'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW03/anastasia_evsihneyeva/anastasia_evsihneyeva_hw_03_t_04'

RSpec.describe Homework3 do
  forth_excersise_variable = described_class.new
  context 'when passed nil string' do
    it 'returns hash with 0s values' do
      expect(forth_excersise_variable.task4(
               nil
             )).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when string doesn\'t contain any digit and letter' do
    it 'returns hash with 0s values' do
      expect(forth_excersise_variable.task4('.+)/*-')).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when passed normal string with digits ans letters' do
    it 'return hash with correct amount of signs' do
      expect(forth_excersise_variable.task4('456ter 18amg')).to eq({ digits: 5, letters: 6 })
    end
  end
end
