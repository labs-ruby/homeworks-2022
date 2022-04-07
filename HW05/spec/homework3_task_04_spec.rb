# frozen_string_literal: true

require_relative '../HW03/ihar_shkuryn_hw_03_t_04'

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  context 'when log is a nil' do
    let(:log) { nil }

    it 'raised argument error' do
      expect { obj.task4(log) }.to raise_error(ArgumentError, 'Only string are allowed')
    end
  end

  context 'when word is empty' do
    it 'returns number of letters=0 and digits=0' do
      expect(obj.task4('  ')).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when word is special symbols' do
    it 'returns number of letters=0 and digits=0' do
      expect(obj.task4('!_+-)(')).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when boolean in params' do
    let(:log) { true }

    it 'raised argument error' do
      expect { obj.task4(log) }.to raise_error(ArgumentError, 'Only string are allowed')
    end
  end
end
