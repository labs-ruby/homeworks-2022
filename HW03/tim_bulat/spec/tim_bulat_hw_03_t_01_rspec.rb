# frozen_string_literal: true

require_relative '../tim_bulat_hw_03_t_01'

RSpec.describe Homework3 do
  describe '#task1' do
    let(:log_with_errors) do
      '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
      2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
      2018-04-23 21:30:42: SSL error
      10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'
    end

    let(:log_no_errors) do
      '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /grid/2/event HTTP/1.1" 200 - 0.2277
        10.6.246.101 - - [23/Apr/2018:20:29:39 +0300] "POST /grid/2/messages HTTP/1.1" 200 48 0.0290'
    end

    let(:error) { '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>' }

    context 'when empty string' do
      subject { described_class.new.task1('') }

      it 'returns empty string' do
        expect(subject).to eq ''
      end
    end

    context 'when log has NO errors' do
      subject { described_class.new.task1(log_no_errors) }

      it 'returns empty string' do
        expect(subject).to eq ''
      end
    end

    context 'when log has erorr lines' do
      subject { described_class.new.task1(log_with_errors) }

      it 'returns 1st string with error' do
        expect(subject).to eq(error)
      end
    end
  end
end
