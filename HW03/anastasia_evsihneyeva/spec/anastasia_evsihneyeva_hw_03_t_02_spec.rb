# frozen_string_literal: true

require_relative '/home/anastasia/Документы/ruby/homeworks-2022/spec/spec_helper'
require_relative '/home/anastasia/Документы/ruby/homeworks-2022/HW03/anastasia_evsihneyeva/anastasia_evsihneyeva_hw_03_t_02'

RSpec.describe Homework3 do
  second_excersise_variable = described_class.new

  context 'when passed string is empty' do
    it 'returns an empty array' do
      expect(second_excersise_variable.task2(
               ''
             )).to eq []
    end
  end

  context 'when string doesn\'t contain suitable information' do
    it 'returns an empty array' do
      expect(second_excersise_variable.task2("2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          2018-04-23 20:30:45: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: ScriptError error: 0 - 0>")).to eq []
    end
  end

  context 'when string contains suitable information' do
    it 'returns list of strings in suitable format' do
      expect(second_excersise_variable.task2("2018-04-210.6.246.101 - - [23/Apr/2018:20:30:42 +0300] \"POST /test/2/run HTTP/1.1\" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>")).to eq [
            'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 2018-04-210.6.246.101 TO: /TEST/2/RUN'
          ]
    end
  end
end
