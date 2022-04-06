# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/spec/spec_helper'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW03/anastasia_evsihneyeva/anastasia_evsihneyeva_hw_03_t_03'

RSpec.describe Homework3 do
  trird_excersise_variable = described_class.new
  context 'when passed string is empty' do
    it 'returns string with 0 number' do
      expect(trird_excersise_variable.task3(
               ''
             )).to eq '0'
    end
  end

  context 'when passed nil string' do
    it 'returns string with 0 number' do
      expect(trird_excersise_variable.task3(nil)).to eq '0'
    end
  end
end
