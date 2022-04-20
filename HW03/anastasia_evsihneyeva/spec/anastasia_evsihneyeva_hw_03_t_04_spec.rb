# frozen_string_literal: true

require_relative '../../../spec/spec_helper'
require_relative '../anastasia_evsihneyeva_hw_03_t_04'

RSpec.describe Homework3 do
  context 'when passed nil string' do
    it 'returns hash with 0s values' do
      expect(subject { described_class.configuration }.task4(nil)).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when string doesn\'t contain any digit and letter' do
    it 'returns hash with 0s values' do
      expect(subject { described_class.configuration }.task4('.+)/*-')).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when passed normal string with digits ans letters' do
    it 'return hash with correct amount of signs' do
      expect(subject { described_class.configuration }.task4('456ter 18amg')).to eq({ digits: 5, letters: 6 })
    end
  end
end
