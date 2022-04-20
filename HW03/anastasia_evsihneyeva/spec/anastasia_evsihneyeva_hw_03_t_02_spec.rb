# frozen_string_literal: true

require_relative '../../../spec/spec_helper'
require_relative '../anastasia_evsihneyeva_hw_03_t_02'

RSpec.describe Homework3 do
  subject { described_class.new }

  let(:log1) do
    "2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
     2018-04-23 20:30:45: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: ScriptError error: 0 - 0>"
  end

  let(:log2) do
    "2018-04-210.6.246.101 - - [23/Apr/2018:20:30:42 +0300] \"POST /test/2/run HTTP/1.1\" 200 - 0.2277
     2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>"
  end

  context 'when passed string is empty' do
    it 'returns an empty array' do
      expect(subject.task2('')).to eq []
    end
  end

  context 'when string doesn\'t contain suitable information' do
    it 'returns an empty array' do
      expect(subject.task2(log1)).to eq []
    end
  end

  context 'when string contains suitable information' do
    let(:expected_output) do
      ['DATE: 23/Apr/2018:20:30:42 +0300 FROM: 2018-04-210.6.246.101 TO: /TEST/2/RUN']
    end

    it 'returns list of strings in suitable format' do
      expect(subject.task2(log2)).to eq(expected_output)
    end
  end
end
