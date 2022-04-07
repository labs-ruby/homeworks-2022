# frozen_string_literal: true

require_relative '../ivan_klimov_hw_03_t_02'

RSpec.describe Homework3 do
  subject { described_class.new }

  describe '#task1' do
    context 'when logs are empty' do
      let(:logs) { '' }

      it 'returns an empty array' do
        expect(subject.task2(logs)).to eq([])
      end
    end

    context 'when there are no right logs' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - -"POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        LOGS
      end

      it 'returns an empty array' do
        expect(subject.task2(logs)).to eq([])
      end
    end

    context 'when logs have more than one error' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
          2020-04-23 SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
        LOGS
      end

      it 'returns array with all errors' do
        expect(subject.task2(logs)).to eq(['DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
                                           'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
                                           'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'])
      end
    end
  end
end
