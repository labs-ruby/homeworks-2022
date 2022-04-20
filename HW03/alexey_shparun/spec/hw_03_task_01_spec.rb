# frozen_string_literal: true

require_relative '../alexey_shparun_hw_03_t_01'

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  context 'when there is no error' do
    let(:log) do
      <<~LOG
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
      LOG
    end

    it 'returns the empty string' do
      expect(obj.task1(log)).to eq('')
    end
  end

  context 'when there is an error' do
    let(:text_with_error) do
      '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    end
    let(:log) do
      <<~LOG
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
      LOG
    end

    it 'returns full text of the first line with an error' do
      expect(obj.task1(log)).to eq(text_with_error)
    end
  end
end
