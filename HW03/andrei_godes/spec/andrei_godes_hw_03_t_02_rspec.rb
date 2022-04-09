# frozen_string_literal: true

require_relative '../andrei_godes_hw_03_t_02'
require_relative 'spec_helper'

RSpec.describe Homework3 do
  subject { described_class.new }

  context 'when the input is empty' do
    it 'returns an empty array' do
      expect(subject.task2('')).to eq([])
    end
  end

  context 'when some strings are in the right format' do
    let(:log) do
      <<~LOG
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      LOG
    end
    let(:output) do
      [
        'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
        'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
        'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
      ]
    end

    it 'returns array only with format-matched strings' do
      expect(subject.task2(log)).to eq(output)
    end
  end

  context 'when there are no mathing strings in the input' do
    let(:log) do
      <<~LOG
        10.6.246.103 - - [23/Apfgh9 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
        452345 - - [345r/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/99" 200 48 0.0290
      LOG
    end

    it 'returns an empty array' do
      expect(subject.task2(log)).to eq([])
    end
  end

  context 'when all input is in the right format' do
    let(:log) do
      <<~LOG
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
        10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      LOG
    end
    let(:output) do
      [
        'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
        'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
        'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
      ]
    end

    it 'returns array with all strings in right format' do
      expect(subject.task2(log)).to eq(output)
    end
  end
end
