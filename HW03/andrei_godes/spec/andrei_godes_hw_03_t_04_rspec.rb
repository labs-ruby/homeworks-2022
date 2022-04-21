# frozen_string_literal: true

require_relative '../andrei_godes_hw_03_t_04'
require_relative 'spec_helper'

RSpec.describe Homework3 do
  subject { described_class.new }

  context 'when string consists of letters and digits' do
    it 'returns number of letters and digits' do
      expect(subject.task4('aefgh455fd67')).to eq({ digits: 5, letters: 7 })
    end
  end

  context 'when string consists of letters, digits and symbols' do
    it 'returns number of letters and digits' do
      expect(subject.task4('1654bjh78-=0kjjhv')).to eq({ digits: 7, letters: 8 })
    end
  end

  context 'when string is empty' do
    it 'returns number 0 letters and 0 digits' do
      expect(subject.task4('')).to eq({ digits: 0, letters: 0 })
    end
  end
end
