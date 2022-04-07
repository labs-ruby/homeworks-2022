# frozen_string_literal: true

require_relative '../../aleksei_zhuchkov_hw_03_t_03'

RSpec.describe 'Homework3' do
  let(:obj_hw3) { Homework3.new }

  context 'when testing basic things' do
    it 'return value is string type' do
      expect(obj_hw3.task3('')).to be_an_instance_of(String)
    end

    it 'return value "0" (string) when get empty string' do
      expect(obj_hw3.task3('')).to eq('0')
    end
  end

  context 'when testing log with one right result' do
    let(:log) do
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
    it 'return type of strind' do
      expect(obj_hw3.task3(log)).to be_an_instance_of(String)
    end
  end

  context 'when there is more than 2 valid event' do
    let(:log) do
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

    it 'returns value type Array' do
      expect(obj_hw3.task3(log)).to be_an_instance_of(Array)
    end
  end
end
