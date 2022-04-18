# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../siarhei_pratasevich_hw_03_t_02'

RSpec.describe Homework3 do
  subject { described_class.new.task2(log) }

  describe 'Log that has wrong output' do
    context 'when text given in wrong format' do
      let(:log) do
        <<~LOGS
          [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          [23/Apr/2018:20:30:39 +0300] 10.6.246.103 - - "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          100.6.246.103 - - [23-Apr-2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          "POST /test/2/messages HTTP/1.1" 200 48 0.0498 100.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.103 - - "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - -"POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - -"POST /test/2/messages HTTP/1.1" 200 48 0.0290
        LOGS
      end

      it 'returns an empty array' do
        expect(subject).to eq([])
      end
    end

    context 'when log is not String class' do
      let(:log) { nil }

      it 'returns an empty array' do
        expect(subject).to eq([])
      end
    end
  end
end
