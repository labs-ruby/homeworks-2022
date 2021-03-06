# frozen_string_literal: true

require_relative '../maksim_manzhai_hw_03_t_02'

RSpec.describe Homework3 do
  describe '#task2' do
    subject { described_class.new.task2(log) }

    context 'when log is right' do
      let(:log) do
        <<~LOG
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        LOG
      end

      let(:output) do
        [
          'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /GRID/2/MESSAGES',
          'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /GRID/2/EVENT',
          'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /GRID/2/MESSAGES'
        ]
      end

      it 'returns an array of formatted strings containing information about post requests' do
        expect(subject).to eql output
      end

      it 'returns an object of class Array' do
        expect(subject).to be_a(Array)
      end
    end

    context 'when log does contain wrong strings' do
      let(:log) do
        <<~LOG
            10.6.246.103 - - "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - -"POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - -"POST /test/2/messages HTTP/1.1" 200 48 0.0290
        LOG
      end

      it 'returns empty array' do
        expect(subject).to eql([])
      end
    end
  end
end
