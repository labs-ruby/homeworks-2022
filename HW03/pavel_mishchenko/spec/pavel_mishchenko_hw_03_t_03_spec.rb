# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../pavel_mishchenko_hw_03_t_03'

RSpec.describe Homework3 do
  subject { described_class.new.task3(log) }

  describe 'Log that has right output' do
    context 'when log has wrong format' do
      let(:log) do
        <<~LOGS
          2018/04/23 17-17-49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
          2018/04/23 17-17-49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018/04/23 17-17-49.8 ubuntu-xenial[14319] Debug - docker event processed
          2018/04/23 17-18-19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
          2018/04/23 17-18-38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
          2018/04/23 17-18-38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
          2018/04/23 17-19-38.81 ubuntu xenial[14319] Debug - Calling core with action- messages
          2018/04/23 17-18-59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
        LOGS
      end

      it 'returns 0' do
        expect(subject).to eq('0')
      end
    end
  end

  describe 'Log that has wrong output' do
    context 'when log is not String class' do
      let(:log) { 404 }
      # at the input of method task3 (read "variable") is sent TEXT

      it 'returns ArgumentError' do
        expect { subject }.to raise_error(TypeError)
      end
    end
  end
end
