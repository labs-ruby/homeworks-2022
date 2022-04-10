# frozen_string_literal: true

RSpec.describe 'Homework3' do
  let(:obj) { Object.const_get(:Homework3).new }

  describe '::log that has right output' do
    subject(:create) { obj.task3(logs) }

    context 'when there is more than 2 valid event' do
      let(:logs) do
        <<~LOGS
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns duration of the action in seconds between events' do
        expect(create).to eq(['49.1', '60.0'])
      end
    end

    context 'when there are no valid events' do
      let(:logs) do
        <<~LOGS
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns 0' do
        expect(create).to eq('0')
      end
    end

    context 'when there is one valid event' do
      let(:logs) do
        <<~LOGS
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns 0' do
        expect(create).to eq('0')
      end
    end

    context 'when there is two valid event' do
      let(:logs) do
        <<~LOGS
          2018-12-31 23:59:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-12-31 23:59:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-12-31 23:59:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2019-01-01 00:00:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2019-01-01 00:00:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2019-01-01 00:00:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2019-01-01 00:00:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns duration of the action in seconds between events' do
        expect(create).to eq('49.1')
      end
    end
  end

  describe '::log that has wrong output' do
    context 'when no arguments given' do
      it 'returns ArgumentError' do
        expect { obj.task3 }.to raise_error(ArgumentError)
      end
    end
  end
end
