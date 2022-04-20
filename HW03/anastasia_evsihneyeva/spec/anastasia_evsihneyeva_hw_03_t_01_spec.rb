# frozen_string_literal: true

require_relative '../anastasia_evsihneyeva_hw_03_t_01'
require_relative '../../../spec/spec_helper'

RSpec.describe Homework3 do
  let(:log) do
    "2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>
    2018-04-23 20:30:45: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: ScriptError error: 0 - 0>
    2018-04-23 20:30:49: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: ArgumentError error: 0 - 0>"
  end

  context 'when there is no error strings in logs' do
    it 'returns empty string' do
      expect(subject { described_class.configuration }.task1('blablabla')).to eq ''
    end
  end

  context 'when all strings contain \'error\' word' do
    let(:expected_output) do
      '2018-04-23 20:30:42: SSL error, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSLError: System error: Undefined error: 0 - 0>'
    end

    it 'returns first string' do
      expect(subject { described_class.configuration }.task1(log)).to eq(expected_output)
    end
  end
end
