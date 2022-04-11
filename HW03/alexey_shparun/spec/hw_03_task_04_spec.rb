# frozen_string_literal: true

require_relative '../alexey_shparun_hw_03_t_04'

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  context 'when string is empty' do
    it 'returns number 0 letters and 0 digits' do
      expect(obj.task4('')).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when string consists letters and digits' do
    it 'returns number of letters and digits' do
      expect(obj.task4('wefr546')).to eq({ digits: 3, letters: 4 })
    end
  end
end
