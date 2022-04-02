# frozen_string_literal: true

require_relative '../maksim_manzhai_hw_03_t_03'

RSpec.describe Homework3 do
  describe '#task3' do
    let(:homework) { described_class.new }

    context 'when the log contains one value' do
      let(:log) do
        <<~LOG
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOG
      end

      let(:output) { '49.1' }

      it 'returns a string containing the duration of the action in SECONDS between events that occurred at the time of Calling core with action' do
        expect(homework.task3(log)).to eql output
      end

      it 'returns an object of class String' do
        expect(homework.task3(log)).to be_a(String)
      end
    end

    context 'when the log contains multiple values' do
      let(:log) do
        <<~LOG
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
          2018-04-23 17:20:01.3 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:20:01.3 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:20:29.7 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOG
      end

      let(:output) { ['49.1', '82.5'] }

      it 'returns an array containing strings of the action in SECONDS between events that occurred at the time of Calling core with action' do
        expect(homework.task3(log)).to eql output
      end

      it 'returns an object of class Array' do
        expect(homework.task3(log)).to be_a(Array)
      end
    end

    context 'when log does not contain valid values' do
      let(:log) do
        <<~LOG
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOG
      end

      let(:output) { '0' }

      it 'returns string with 0' do
        expect(homework.task3(log)).to eql output
      end
    end
  end
end
