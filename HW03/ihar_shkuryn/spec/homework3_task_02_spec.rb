# frozen_string_literal: true

require_relative '../ihar_shkuryn_hw_03_t_02'

RSpec.describe Homework3 do
  let(:subject) { described_class.new }

  describe 'Log has wrong output' do
    context 'when log is a nil' do
      let(:log) { nil }

      it 'output is a empty' do
        expect(subject.task2(log)).to eq([])
      end
    end

    context 'when log is empty string' do
      let(:log) { '' }

      it 'output is a empty array' do
        expect(subject.task2(log)).to eq([])
      end
    end

    context 'when got array in params' do
      let(:log) { ['error'] }

      it 'output is a empty array' do
        expect(subject.task2(log)).to eq([])
      end
    end

    context 'when is it array in result' do
      let(:log) { true }

      it 'output is a empty' do
        expect(subject.task2(log)).to eq([])
      end
    end
  end

  describe 'Log has right output' do
    let(:log) do
      <<~LOGS
        10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
        10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
        2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL:
        10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290
      LOGS
    end

    context 'when text given in right format' do
      let(:right_output) do
        [
          'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
          'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
          'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
        ]
      end

      it 'returns an array of formatted strings' do
        expect(subject.task2(log)).to eq(right_output)
      end

      it 'returns instance of array' do
        expect(subject.task2(log)).to be_an_instance_of(Array)
      end
    end
  end
end
