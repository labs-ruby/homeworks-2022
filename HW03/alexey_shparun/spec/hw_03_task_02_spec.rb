# frozen_string_literal: true

require_relative '../alexey_shparun_hw_03_t_02'

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  describe 'Log that has wrong output' do
    context 'when text are not given' do
      it 'returns an empty array' do
        expect(obj.task2('')).to eq([])
      end
    end

    context 'when the incoming data include the correct format' do
      let(:log) do
        <<~LOG
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
        LOG
      end

      let(:right_output) do
        [
          'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
          'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
          'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
        ]
      end

      it 'return array with formatted strings' do
        expect(obj.task2(log)).to eq(right_output)
      end
    end
  end
end
