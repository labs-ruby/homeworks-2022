# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW03/anastasia_evsihneyeva/anastasia_evsihneyeva_hw_03_t_04'

RSpec.describe Homework3 do
  forth_excersise_variable = described_class.new

  it 'if string is nil' do
    expect(forth_excersise_variable.task4(
             nil
           )).to eq({ digits: 0, letters: 0 })
  end

  it "if string doesn't contain any digit and letter" do
    expect(forth_excersise_variable.task4('.+)/*-')).to eq({ digits: 0, letters: 0 })
  end

  it 'if there is some signs in string' do
    expect(forth_excersise_variable.task4('456ter 18amg')).to eq({ digits: 5, letters: 6 })
  end
end
