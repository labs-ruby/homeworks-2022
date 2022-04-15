# frozen_string_literal: true

require_relative '../vitaly_kadyrko_hw_03_t_04'

RSpec.describe Homework3 do
  subject { described_class.new }

  context 'when string contains russian letter z' do
    it 'returns number of digits and letters' do
      expect(t4_obj.task4('a2b1c6n8з')).to eq({ digits: 4, letters: 5 })
    end
  end

  context 'when string contains special symbols' do
    it 'returns only number of digits and letters' do
      expect(t4_obj.task4('?$a1b2c3d4++')).to eq({ digits: 4, letters: 4 })
    end
  end
end
