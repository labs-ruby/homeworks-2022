# frozen_string_literal: true

require_relative '../andrei_godes_hw_03_t_03'
require_relative 'spec_helper'

RSpec.describe Homework3 do
  subject { described_class.new.task3(log) }

  context 'when there is three or more valid event' do
    let(:log) do
      <<~LOGS
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - dockmore than 2er event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        2018-04-23 17:30:48.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      LOGS
    end

    it { is_expected.to eq(['49.1', '60.0', '670.0']) }
  end

  context 'when there is two valid events' do
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

    it { is_expected.to eq('49.1') }
  end

  context 'when there is only one valid event' do
    let(:log) do
      <<~LOGS
        2018-12-31 23:59:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-12-31 23:59:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
      LOGS
    end

    it { is_expected.to eq('0') }
  end

  context 'when there is no valid event' do
    let(:log) do
      <<~LOGS
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
      LOGS
    end

    it { is_expected.to eq('0') }
  end
end
