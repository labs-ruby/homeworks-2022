# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW03/anastasia_evsihneyeva/anastasia_evsihneyeva_hw_03_t_03'

RSpec.describe Homework3 do
  trird_excersise_variable = described_class.new

  it 'if there is emplty string' do
    expect(trird_excersise_variable.task3(
             ''
           )).to eq '0'
  end

  it 'if there is nil string' do
    expect(trird_excersise_variable.task3(nil)).to eq '0'
  end

  it 'if there is long period where core is called' do
    expect(trird_excersise_variable.task3("2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2021-08-02 18:17:50.0 ubuntu-xenial[14321] Debug - Calling core with action: event")).to eq '103424400.3'
  end
end
