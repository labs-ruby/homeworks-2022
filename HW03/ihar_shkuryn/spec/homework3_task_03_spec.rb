# frozen_string_literal: true

require_relative '../ihar_shkuryn_hw_03_t_03'

RSpec.describe Homework3 do
  let(:obj) { described_class.new }

  describe 'Log has wrong output' do
    context 'when log is a nil' do
      let(:log) { nil }

      it 'when log.nil?' do
        expect { obj.task3(log) }.to raise_error(TypeError, 'Only string are allowed')
      end
    end

    context 'when log is empty string' do
      let(:log) { '' }

      it 'output is a empty' do
        expect(obj.task3(log)).to eq('0')
      end
    end

    context 'when array in params' do
      let(:log) { ['error']  }

      it 'output is a empty' do
        expect { obj.task3(log) }.to raise_error(TypeError, 'Only string are allowed')
      end
    end

    context 'when log is boolean' do
      let(:log) { true }

      it 'log  is a boolean' do
        expect { obj.task3(log) }.to raise_error(TypeError, 'Only string are allowed')
      end
    end

    context 'when log is empty array' do
      let(:log) { []  }

      it 'returns TypeError in case log == array' do
        expect { obj.task3(log) }.to raise_error(TypeError, 'Only string are allowed')
      end
    end
  end

  # describe 'Log that has right output' do
  #   subject { obj.task3(log) }

  #   context 'when there is more than 2 valid event' do
  #     let(:log) do
  #       <<~LOGS
  #         2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  #         2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  #         2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  #         2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  #         2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  #         2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  #         2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  #         2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
  #       LOGS
  #     end

  #     it 'returns duration of the action in seconds between events' do
  #       expect(subject).to eq(['49.1', '60.0'])
  #     end
  #   end

  #   context 'when there are no valid events' do
  #     let(:log) do
  #       <<~LOGS
  #         2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  #         2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  #         2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  #         2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  #         2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
  #       LOGS
  #     end

  #     it 'returns 0' do
  #       expect(subject).to eq('0')
  #     end
  #   end

  #   context 'when there is one valid event' do
  #     let(:log) do
  #       <<~LOGS
  #         2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  #         2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  #         2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
  #         2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  #         2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  #         2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
  #       LOGS
  #     end

  #     it 'returns 0' do
  #       expect(subject).to eq('0')
  #     end
  #   end

  #   context 'when there is two valid event' do
  #     let(:log) do
  #       <<~LOGS
  #         2018-12-31 23:59:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
  #         2018-12-31 23:59:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  #         2018-12-31 23:59:49.8 ubuntu-xenial[14319] Debug - docker event processed
  #         2019-01-01 00:00:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
  #         2019-01-01 00:00:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
  #         2019-01-01 00:00:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
  #         2019-01-01 00:00:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
  #       LOGS
  #     end

  #     it 'returns duration of the action in seconds between events' do
  #       expect(subject).to eq('49.1')
  #     end
  #   end
  # end
end
