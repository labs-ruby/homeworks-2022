# frozen_string_literal: true

require './sasha_korchyk_hw_03_t_02'

describe Homework3 do
  describe '#task2' do
    let(:obj) { described_class.new }

    context 'with calls methods and return corrent formated array' do
      let(:logs) do
        '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
          10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
          2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
          10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
      end

      let(:correct_output) do
        [
          'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
          'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
          'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
        ]
      end

      it 'calls #true_strs' do
        allow(obj).to receive(:true_strs)
        allow(obj).to receive(:result)

        obj.task2(logs)

        expect(obj).to have_received(:true_strs)
      end

      it 'calls #result' do
        allow(obj).to receive(:result)

        obj.task2(logs)

        expect(obj).to have_received(:result)
      end

      it 'returns an array of formatted strings' do
        expect(subject.task2(logs)).to eq(correct_output)
      end
    end

    context 'without suitable string at the input' do
      it 'returns an empty array' do
        expect(subject.task2('')).to eq([])
      end
    end
  end

  describe '#true_strs' do
    let(:log) do
      '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498
      10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277
      2018-04-23 20:30:42: SSL ERROR, peer: 10.6.246.101, peer cert: , #<Puma::MiniSSL::SSL: System error: Undefined error: 0 - 0>
      10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
    end

    let(:correct_output) do
      [
        '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498',
        '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277',
        '10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
      ]
    end

    it 'selects the correct data from the log and returns an array with this data' do
      expect(subject.true_strs(log)).to eq(correct_output)
    end
  end

  describe '#result' do
    let(:correct_data_form_log) do
      [
        '10.6.246.103 - - [23/Apr/2018:20:30:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0498',
        '10.6.246.101 - - [23/Apr/2018:20:30:42 +0300] "POST /test/2/run HTTP/1.1" 200 - 0.2277',
        '10.6.246.101 - - [23/Apr/2018:20:31:39 +0300] "POST /test/2/messages HTTP/1.1" 200 48 0.0290'
      ]
    end

    let(:result) do
      [
        'DATE: 23/Apr/2018:20:30:39 +0300 FROM: 10.6.246.103 TO: /TEST/2/MESSAGES',
        'DATE: 23/Apr/2018:20:30:42 +0300 FROM: 10.6.246.101 TO: /TEST/2/RUN',
        'DATE: 23/Apr/2018:20:31:39 +0300 FROM: 10.6.246.101 TO: /TEST/2/MESSAGES'
      ]
    end

    it 'formats the selected data from the log and returns an array with this data' do
      expect(subject.result(correct_data_form_log)).to eq(result)
    end
  end
end
