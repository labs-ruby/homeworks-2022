# frozen_string_literal: true

require_relative 'spec_helper'
require_relative '../pavel_mishchenko_hw_03_t_01'

RSpec.describe Homework3 do
  subject { described_class.new.task1(log) }

  describe 'Log that has right output' do
    context 'when logs have only errors' do
      let(:log) do
        <<~LOGS
          2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          2019-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          2020-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
          2077-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
        LOGS
      end
      let(:right_output) do
        '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
      end

      it 'returns full text of the first line with an error' do
        expect(subject).to eq(right_output)
      end
    end
  end

  describe 'Log that has wrong output' do
    context 'when log is not String class' do
      let(:log) { 404 }

      it 'returns ArgumentError' do
        expect { subject }.to raise_error(TypeError)
      end
    end
  end
end
