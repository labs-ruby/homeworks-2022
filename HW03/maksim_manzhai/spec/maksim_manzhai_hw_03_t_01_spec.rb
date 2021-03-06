# frozen_string_literal: true

require_relative '../maksim_manzhai_hw_03_t_01'

RSpec.describe Homework3 do
  describe '#task1' do
    subject { described_class.new.task1(log) }

    context 'when log is text that does not contain the word error' do
      let(:log) do
        <<~LOG
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        LOG
      end

      it 'returns an empty string' do
        expect(subject).to eql('')
      end
    end

    context 'when log have error' do
      let(:log) do
        <<~LOG
          10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290
        LOG
      end

      let(:output) do
        '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
      end

      it 'returns line with full text of the first line with an error' do
        expect(subject).to eql output
      end
    end

    context 'when log is empty' do
      let(:log) { '' }

      it 'returns empty string' do
        expect(subject).to eql('')
      end
    end
  end
end
