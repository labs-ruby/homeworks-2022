# frozen_string_literal: true

require_relative '../tim_bulat_hw_03_t_02'

RSpec.describe Homework3 do
  describe '#task2' do
    subject { described_class.new.task2(log) }

    let(:log_without_post) do
      '2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert:
        , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>'
    end

    let(:log_with_post) do
      '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
            10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
            2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
            10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
    end

    let(:formated_strings) do
      [
        'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
        'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
        'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
      ]
    end

    context 'when log is empty' do
      let(:log) { '' }

      it 'returns empty array' do
        expect(subject).to eq []
      end
    end

    context 'when there are not post methods in the log' do
      let(:log) { log_without_post }

      it 'returns empty array' do
        expect(subject).to eq []
      end
    end

    context 'when log has right format' do
      let(:log) { log_with_post }

      it 'returns array' do
        expect(subject).to be_a Array
      end

      it 'returns array of formated strings' do
        expect(subject).to eq(formated_strings)
      end
    end
  end
end
