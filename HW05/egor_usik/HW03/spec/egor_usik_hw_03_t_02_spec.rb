# frozen_string_literal: true

RSpec.describe 'Homework3' do
  let(:obj) { Object.const_get(:Homework3).new }

  describe '::log that has valid output' do
    subject(:create) { obj.task2(logs) }

    context 'when the log file is given contains an error line' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end
      let(:right_logs) do
        [
          'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
          'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
          'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
        ]
      end

      it 'returns an array' do
        expect(create).to eq(right_logs)
      end
    end

    context 'when the log file is given contains multiple error line' do
      let(:logs) do
        <<~LOGS
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end
      let(:right_logs) do
        [
          'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
          'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
          'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
        ]
      end

      it 'returns an array' do
        expect(create).to eq(right_logs)
      end
    end

    context 'when the log file is given contains no error lines' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end
      let(:right_logs) do
        [
          'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
          'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
          'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
        ]
      end

      it 'returns an array' do
        expect(create).to eq(right_logs)
      end
    end

    context 'when the log file is given contains no valid lines' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "GET /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "GET /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        LOGS
      end

      it 'returns an empty array' do
        expect(create).to eq([])
      end
    end

    context 'when the log file is given contains wrong format lines' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101- [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "GET /test/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end

      it 'returns an empty array' do
        expect(create).to eq([])
      end
    end
  end

  describe '::log that has invalid output' do
    context 'when empty string is given' do
      it 'returns an empty array' do
        expect(obj.task2('')).to eq([])
      end
    end

    context 'when nil is given' do
      it 'returns an empty array' do
        expect(obj.task2(nil)).to eq([])
      end
    end

    context 'when no arguments are given' do
      it 'returns an error' do
        expect { obj.task2 }.to raise_error(ArgumentError)
      end
    end
  end
end
