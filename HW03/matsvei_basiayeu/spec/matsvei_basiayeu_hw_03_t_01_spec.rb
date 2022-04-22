# frozen_string_literal: true

require 'rspec'
require_relative 'spec_helper'
require './matsvei_basiayeu_hw_03_t_01'

RSpec.describe Homework3 do
  subject { described_class.new.task1(logs) }

  describe 'Logs are right' do
    context 'when one error in the logs' do
      let(:logs) do
        <<~ENTRY_LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        ENTRY_LOGS
      end
      let(:expected_output) do
        '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
      end

      it 'returns full needed line' do
        expect(subject).to eq(expected_output)
      end
    end

    context 'when there are more than one error in logs' do
      let(:logs) do
        <<~ENTRY_LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
          2021-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        ENTRY_LOGS
      end

      it 'answer is full line' do
        expect(subject).to eq('2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>')
      end
    end

    context 'when there are no errors in the logs' do
      let(:logs) do
        <<~ENTRY_LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
        ENTRY_LOGS
      end

      it 'returns an empty string' do
        expect(subject).to eq('')
      end
    end
  end

  describe 'Logs are not right' do
    context 'when text are not given' do
      let(:logs) { '' }

      it 'returns an empty string' do
        expect(subject).to eq('')
      end
    end

    context 'when argument is nil' do
      let(:logs) { nil }

      it 'returns an empty string ' do
        expect(subject).to eq('')
      end
    end
  end
end
