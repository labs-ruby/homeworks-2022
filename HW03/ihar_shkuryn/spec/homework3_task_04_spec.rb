# frozen_string_literal: true

require_relative '../ihar_shkuryn_hw_03_t_04'

RSpec.describe Homework3 do
  let(:subject) { described_class.new }

  context 'when log is a nil' do
    let(:log) { nil }

    it 'raised argument error' do
      expect { subject.task4(log) }.to raise_error(ArgumentError, 'Only string are allowed')
    end
  end

  context 'when word is empty' do
    it 'returns number of letters=0 and digits=0' do
      expect(subject.task4('  ')).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when word is special symbols' do
    let(:log) { '!_+-)(' }

    it 'returns number of letters=0 and digits=0' do
      expect(subject.task4(log)).to eq({ digits: 0, letters: 0 })
    end

    it 'returns an instance of hash' do
      expect(subject.task4(log)).to be_an_instance_of(Hash)
    end
  end

  context 'when boolean in params' do
    let(:log) { true }

    it 'raised argument error' do
      expect { subject.task4(log) }.to raise_error(ArgumentError, 'Only string are allowed')
    end
  end
end
