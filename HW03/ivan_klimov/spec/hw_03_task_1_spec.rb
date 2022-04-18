# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../ivan_klimov_hw_03_t_01'

RSpec.describe Homework3 do
  subject { described_class.new.task1(logs) }

  describe '#task1' do
    context 'when logs are empty' do
      let(:logs) { '' }

      it 'returns an empty string' do
        expect(subject).to eq('')
      end
    end

    context 'when logs have no errors' do
      let(:logs) do
        <<~LOGS
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] \"POST /grid/2/messages HTTP/1.1\" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] \"POST /grid/2/event HTTP/1.1\" 200 - 0.2277
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] \"POST /grid/2/messages HTTP/1.1\" 200 48 0.0290
        LOGS
      end

      it 'returns an empty string' do
        expect(subject).to eq('')
      end
    end
  end

  context 'when logs have one error' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        2021-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
      LOGS
    end

    let(:correct_answer) do
      '2021-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    end

    it 'returns one error' do
      expect(subject).to eq(correct_answer)
    end
  end

  context 'when logs have many errors' do
    let(:logs) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        2021-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
      LOGS
    end

    let(:correct_answer) do
      '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    end

    it 'returns first error' do
      expect(subject).to eq(correct_answer)
    end
  end
end
