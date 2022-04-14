# frozen_string_literal: true

require_relative '../tim_bulat_hw_03_t_03'

RSpec.describe Homework3 do
  describe '#task3' do
    subject { described_class.new.task3(log) }

    let(:log_two_core_actions) do
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'
    end

    let(:log_without_core_actions) do
      '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
              10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
              2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
              10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
    end

    let(:log_more_than_two_core_actions) do
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
      2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
    end

    let(:log_negative_time) do
      '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        2018-04-23 15:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages'
    end

    context 'when log is empty' do
      let(:log) { '' }

      it 'returns 0' do
        expect(subject).to eq '0'
      end
    end

    context 'when there are no core actions' do
      let(:log) { log_without_core_actions }

      it 'returns 0' do
        expect(subject).to eq '0'
      end
    end

    context 'when there are two core actions' do
      let(:log) { log_two_core_actions }

      it 'returns string' do
        expect(subject).to be_a String
      end

      it 'returns string with calculated time ' do
        expect(subject).to eq '49.1'
      end
    end

    context 'when there are more than two core actions' do
      let(:log) { log_more_than_two_core_actions }

      it 'returns array' do
        expect(subject).to be_a Array
      end

      it 'returns array with calculate time' do
        expect(subject).to eq ['49.1', '60.0']
      end
    end

    context 'when time is not right' do
      let(:log) { log_negative_time }

      it 'returns 0' do
        expect(subject).to eq '0'
      end
    end
  end
end
