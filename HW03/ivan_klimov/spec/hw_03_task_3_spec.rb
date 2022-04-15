# frozen_string_literal: true

require_relative '../ivan_klimov_hw_03_t_03'

RSpec.describe Homework3 do
  subject { described_class.new.task3(logs) }

  describe '#task3' do
    context 'when logs are empty' do
      let(:logs) { '' }

      it 'returns 0' do
        expect(subject).to eq('0')
      end
    end

    context 'when there are no right logs' do
      let(:logs) do
        <<~LOGS
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Caling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Caling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Caling core with action: messages
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns 0' do
        expect(subject).to eq('0')
      end
    end

    context 'when logs have one right element ' do
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
        expect(subject).to eq('0')
      end
    end

    context 'when logs have 2 right elements ' do
      let(:logs) do
        <<~LOGS
          2018-12-31 23:59:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-12-31 23:59:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-12-31 23:59:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2019-01-01 00:00:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2019-01-01 00:04:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2019-01-01 00:00:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2019-01-01 00:00:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns one num' do
        expect(subject).to eq('289.1')
      end
    end

    context 'when logs have more than 2 right elements ' do
      let(:logs) do
        <<~LOGS
          2018-04-23 17:24:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:27:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:27:39.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns difference between all elements' do
        expect(subject).to eq(['169.1', '1.0'])
      end
    end
  end
end
