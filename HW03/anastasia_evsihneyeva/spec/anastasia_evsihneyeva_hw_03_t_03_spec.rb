# frozen_string_literal: true

require_relative '../../../spec/spec_helper'
require_relative '../anastasia_evsihneyeva_hw_03_t_03'

RSpec.describe Homework3 do
  subject { described_class.new }

  context 'when passed string is empty' do
    it 'returns string with 0 number' do
      expect(subject.task3('')).to eq '0'
    end
  end

  context 'when passed nil string' do
    it 'returns string with 0 number' do
      expect(subject.task3(nil)).to eq '0'
    end
  end
end
