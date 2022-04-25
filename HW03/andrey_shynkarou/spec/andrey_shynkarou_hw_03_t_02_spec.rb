# frozen_string_literal: true

require_relative '../andrey_shynkarou_hw_03_t_02'

RSpec.describe Homework3 do
  subject(:obj) { Object.const_get('Homework3').new }

  describe '#task2' do
    context 'when log has wrong output' do
      context 'when text is not given' do
        it 'returns an empty array' do
          expect(obj.task2('')).to eq([])
        end
      end

      context 'when text is given in wrong format' do
        let(:log) do
          <<~LOGS
            10.6.246.103 - - "POST /test/2/messages HTTP/1.1" 200 48 0.0498
            10.6.246.101 - -"POST /test/2/run HTTP/1.1" 200 - 0.2277
            2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            10.6.246.101 - -"POST /test/2/messages HTTP/1.1" 200 48 0.0290
          LOGS
        end

        it 'returns an empty array' do
          expect(obj.task2(log)).to eq([])
        end
      end

      context 'when no arguments are given' do
        it 'raises ArgumentError' do
          expect { obj.task2 }.to raise_error(ArgumentError)
        end
      end
    end

    context 'when log has right output' do
      subject { obj.task2(log) }

      context 'when text is given in right format' do
        let(:log) do
          <<~LOGS
            10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
            2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
          LOGS
        end
        let(:right_output) do
          [
            'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
            'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
            'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
          ]
        end

        it 'returns an array of formatted strings' do
          expect(subject).to eq(right_output)
        end
      end

      context 'when logs have more than one error' do
        let(:log) do
          <<~LOGS
            10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
            2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
            2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
            2020-04-23 SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          LOGS
        end
        let(:right_output) do
          [
            'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
            'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
            'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
          ]
        end

        it 'returns an array of formatted strings' do
          expect(subject).to eq(right_output)
        end
      end

      context 'when logs have no lines with error' do
        let(:log) do
          <<~LOGS
            10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
            10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
          LOGS
        end
        let(:right_output) do
          [
            'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
            'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
            'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
          ]
        end

        it 'returns an array of formatted strings' do
          expect(subject).to eq(right_output)
        end
      end
    end
  end
end
