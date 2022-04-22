# frozen_string_literal: true

require_relative '../andrei_godes_hw_03_t_04'
require_relative 'spec_helper'

RSpec.describe Homework3 do
  subject { described_class.new.task4(string) }

  context 'when string consists of letters and digits' do
    let(:string) {'aefgh455fd67'}
    it { is_expected.to eq({ digits: 5, letters: 7 })}
  
  end

  context 'when string consists of letters, digits and symbols' do
    
    let(:string) {'1654bjh78-=0kjjhv'}
    it { is_expected.to eq({ digits: 7, letters: 8 })}
  end

  context 'when string is empty' do
    
    let(:string) {''}
    it { is_expected.to eq({ digits: 0, letters: 0 })}
  end
end
