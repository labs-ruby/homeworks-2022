# frozen_string_literal: true

require_relative '../alexey_shparun_hw_03_t_03'

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  describe 'Log that has wrong output' do
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

      it 'returns type of string' do
        expect(obj.task3(log)).to be_an_instance_of(String)
      end
    end
  end
end
