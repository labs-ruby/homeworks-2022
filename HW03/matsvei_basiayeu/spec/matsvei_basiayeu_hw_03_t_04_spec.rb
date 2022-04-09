# frozen_string_literal: true

require 'rspec'
require_relative 'spec_helper'
require './matsvei_basiayeu_hw_03_t_04'

RSpec.describe Homework3 do
  describe 'task4' do
    let(:obj) { described_class.new }

describe 'count letters and digits in the string' do
  context 'when word consists digits and letters' do
    it 'returns right number of letters and digits' do
      expect(obj.task4('1245qwertyuiop')).to eq({ digits: 4, letters: 10 })
    end
  end

  context 'when string is empty' do
    it 'returns number of letters=0 and digits=0' do
      expect(obj.task4('')).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when string type is nil' do
    it 'returns number of letters=0 and digits=0' do
      expect(obj.task4(nil)).to eq({ digits: 0, letters: 0 })
    end
  end

  context 'when string consists letters,symbols and digits' do
    it 'returns number of letters and digits' do
      expect(obj.task4('123+._45/,w_45q-+_45./,wer./87,t')).to eq({ digits: 11, letters: 6 })
    end
  end

  context 'when check class' do
    it 'returns right object class ' do
      expect(obj.task4('1234567890ljklglkf')).to be_a(Hash)
    end
  end

  context 'when arguments is don`t given' do
    it 'returns ArgumentError' do
      expect { obj.task4 }.to raise_error(ArgumentError)
    end
  end
end
end
end
