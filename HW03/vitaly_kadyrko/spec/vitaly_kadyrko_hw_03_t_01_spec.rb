# frozen_string_literal: true

require_relative '../vitaly_kadyrko_hw_03_t_01'

RSpec.describe Homework3 do
  subject { described_class.new }

  context 'when given string with double error' do
    let(:log) do
      <<~LOG
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL errorerror, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
      LOG
    end
    let(:double_error_line) do
      '2018-04-23 20:30:42: SSL errorerror, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    end

    it 'returns full line with double error' do
      expect(t1_obj.task1(log)).to eq(double_error_line)
    end
  end

  context 'when given string with wrong error' do
    let(:log) do
      <<~LOG
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL eror, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLEror: System eror: Undefined eror: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
      LOG
    end

    it 'returns empty string' do
      expect(t1_obj.task1(log)).to eq('')
    end
  end
end
