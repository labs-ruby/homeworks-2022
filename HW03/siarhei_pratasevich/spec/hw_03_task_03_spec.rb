# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../siarhei_pratasevich_hw_03_t_03'

RSpec.describe Homework3 do
  subject { described_class.new.task3(log) }

  describe 'Log that has wrong output' do
    context 'when log object is not String class' do
      let(:log) { nil }

      it 'returns 0' do
        expect(subject).to eq('0')
      end
    end

    context 'when "action" line has wrong format' do
      let(:log) do
        <<~LOGS
          2018/04/23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018/04/23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018/04/23 17:19:38.81 ubuntu xenial[14319] Debug - Calling core with action- messages
          2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns 0' do
        expect(subject).to eq('0')
      end
    end
  end

  describe 'Log that has right output' do
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
          2018-04-23 17:19:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
          2018-04-23 17:20:18.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:20:21.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018-04-23 17:20:34.3 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018-04-23 17:20:35.3 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        LOGS
      end

      it 'returns duration of the action in seconds between events' do
        expect(subject).to eq(['49.1', '60.0', '40.0', '15.5'])
      end
    end
  end
end
