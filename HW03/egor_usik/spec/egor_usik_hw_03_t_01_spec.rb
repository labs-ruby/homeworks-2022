# frozen_string_literal: true

require_relative '../egor_usik_hw_03_t_01'

RSpec.describe Homework3 do
  subject { described_class.new }

  describe '::log that has valid output' do
    context 'when the log file contains only one error line' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end
      let(:valid_error_line) do
        '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
      end

      it 'returns error line' do
        expect(subject.task1(logs)).to eq(valid_error_line)
      end
    end

    context 'when the log file contains multiple error lines' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
          2018-04-23 20:30:48: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 1>
        LOGS
      end
      let(:valid_error_line) do
        '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
      end

      it 'returns the first error line' do
        expect(subject.task1(logs)).to eq(valid_error_line)
      end
    end

    context 'when the log file contains one wrong format error line' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
          peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::
        LOGS
      end

      it 'returns an empty string' do
        expect(subject.task1(logs)).to eq('')
      end
    end

    context 'when the log file contains no error lines' do
      it 'returns an empty string' do
        expect(subject.task1('My invalid logfile')).to eq('')
      end
    end
  end

  describe '::log that has wrong output' do
    context 'when empty string is given' do
      it 'returns an empty string' do
        expect(subject.task1('')).to eq('')
      end
    end

    context 'when nil is given' do
      it 'returns an empty string' do
        expect(subject.task1(nil)).to eq('')
      end
    end

    context 'when no arguments are given' do
      it 'returns ArgumentError' do
        expect { subject.task1 }.to raise_error(ArgumentError)
      end
    end
  end
end
