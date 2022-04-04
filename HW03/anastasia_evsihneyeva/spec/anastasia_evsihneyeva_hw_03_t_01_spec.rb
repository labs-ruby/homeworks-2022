# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW03/anastasia_evsihneyeva/anastasia_evsihneyeva_hw_03_t_01'

RSpec.describe Homework3 do
  first_excersise_variable = described_class.new

  it 'if there is no error strings in logs' do
    expect(first_excersise_variable.task1(
             'blablabla'
           )).to eq ''
  end

  it "if all strings contain 'error' word " do
    expect(first_excersise_variable.task1("2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
             2018-04-23 20:30:45: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: ScriptError error: 0 - 0>
             2018-04-23 20:30:49: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: ArgumentError error: 0 - 0>")).to eq '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
  end
end
