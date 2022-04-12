# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../pavel_mishchenko_hw_03_t_01'

RSpec.describe Homework3 do
  describe '#task1' do
    subject { described_class.new.task1(log) }

    context 'when log that has right output' do
      context 'when logs have one error' do
        let(:log) do
          <<~LOGS
            10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
            2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
          LOGS
        end
        let(:right_output) do
          '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
        end

        it('returns full text of the first line with an error') { is_expected.to eq(right_output) }
      end

      context 'when logs have more than one error' do
        let(:log) do
          <<~LOGS
            10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
            2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
            2021-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          LOGS
        end

        let(:right_output) do
          '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
        end

        it('returns full text of the first line with an error') { is_expected.to eq(right_output) }
      end

      context 'when logs have only errors' do
        let(:log) do
          <<~LOGS
            2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
            2019-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
            2020-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
            2077-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          LOGS
        end
        let(:right_output) do
          '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
        end

        it('returns full text of the first line with an error') { is_expected.to eq(right_output) }
      end

      context 'when logs have no lines with error' do
        let(:log) do
          <<~LOGS
            10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
            10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
          LOGS
        end

        it('returns an empty string') { is_expected.to eq('') }
      end
    end

    context 'when log that has wrong output' do
      context 'when text are not given' do
        let(:log) { '' }

        it('returns an empty string') { is_expected.to eq('') }
      end

      context 'when log is not String class' do
        let(:log) { 404 }

        it 'returns TypeError' do
          expect { subject }.to raise_error(TypeError)
        end
      end

      context 'when no arguments is given' do
        subject { described_class.new.task1 }

        it 'returns ArgumentError' do
          expect { subject }.to raise_error(ArgumentError)
        end
      end
    end
  end
end
