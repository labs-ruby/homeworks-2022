# frozen_string_literal: true

require_relative '../tim_bulat_hw_03_t_03'

RSpec.describe Homework3 do
  describe '#task3' do
    let(:log) do
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'
    end

    let(:log_no_core) do
      '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
              10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
              2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
              10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
    end

    let(:log_more_than_two) do
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
    end

    let(:log_wrong_time) do
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        2018-04-23 15:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
    end

    context 'when empty string' do
      subject { described_class.new.task3('') }

      it 'returns 0' do
        expect(subject).to eq '0'
      end
    end

    context 'when no core actions' do
      subject { described_class.new.task3(log_no_core) }

      it 'returns 0' do
        expect(subject).to eq '0'
      end
    end

    context 'when two core calling' do
      subject { described_class.new.task3(log) }

      let(:output) { '49.1' }

      it 'returns string' do
        expect(subject).to be_a String
      end

      it 'returns stirng with calculated time ' do
        expect(subject).to eq output
      end
    end

    context 'when more than two core calling' do
      subject { described_class.new.task3(log_more_than_two) }

      let(:output) { ['49.1', '60.0'] }

      it 'returns array' do
        expect(subject).to be_a Array
      end

      it 'returns array with calculate time' do
        expect(subject).to eq output
      end
    end

    context 'when time is not right' do
      subject { described_class.new.task3(log_wrong_time) }

      it 'returns 0' do
        expect(subject).to eq '0'
      end
    end
  end
end
