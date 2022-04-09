# frozen_string_literal: true

require 'rspec'
require_relative 'spec_helper'
require './matsvei_basiayeu_hw_03_t_01'

RSpec.describe Homework3 do
  describe 'task1' do
    let(:obj) { described_class.new }

    describe 'Logs are right' do
      context 'when one error in the logs' do
        let(:logs) do
          '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'
        end

        it 'returns full needed line' do
          expect(obj.task1(logs)).to eq('2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>')
        end
      end

      context 'when there are more than one error in logs' do
        let(:log) do
          '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
2021-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
        end

        it 'answer is full line' do
          expect(obj.task1(log)).to eq('2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>')
        end
      end

      context 'when there are no errors in the logs' do
        let(:log) do
          '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
        end

        it 'returns an empty string' do
          expect(obj.task1(log)).to eq('')
        end
      end
    end

    describe 'Logs are not right' do
      context 'when text are not given' do
        it 'returns an empty string' do
          expect(obj.task1('')).to eq('')
        end
      end

      context 'when no arguments is given' do
        it 'returns an ArgumentError' do
          expect { obj.task1 }.to raise_error(ArgumentError)
        end

        context 'when argument is nil' do
          let(:logs) { nil }

          it 'returns an empty string ' do
            expect(obj.task1(logs)).to eq('')
          end
        end
      end
    end
  end
end
