# frozen_string_literal: true

require_relative '../../../spec/spec_helper'
require_relative '../anastasia_evsihneyeva_hw_03_t_03'

RSpec.describe Homework3 do
  context 'when passed string is empty' do
    it 'returns string with 0 number' do
      expect(subject { described_class.configuration }.task3('')).to eq '0'
    end
  end

  context 'when passed nil string' do
    it 'returns string with 0 number' do
      expect(subject { described_class.configuration }.task3(nil)).to eq '0'
    end
  end
end
