# frozen_string_literal: true

require_relative '../vitaly_kadyrko_hw_03_t_03'

RSpec.describe Homework3 do
  subject { described_class.new }

  context 'when one of events time is negative' do
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
        2018-04-23 -17:20:18.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
      LOGS
    end

    it 'returns the firs two durations of the action' do
      expect(subject.task3(log)).to eq(['49.1', '60.0'])
    end
  end
end
