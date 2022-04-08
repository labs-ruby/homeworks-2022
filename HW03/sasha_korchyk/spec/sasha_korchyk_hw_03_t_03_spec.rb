require './sasha_korchyk_hw_03_t_03'

describe Homework3 do

  describe '#task3' do

    context 'if log contains only two calling core' do

      let(:log) do
        '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'
      end

      it 'returns correct string of time' do
        expect(subject.task3(log)).to eq("49.1")
      end

    end

    context 'if log contains more then two calling core' do

      let(:log) do
        '2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:19:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event'
      end

      it 'returns an array of correct time' do
        expect(subject.task3(log)).to match_array(['49.1', '60.0'])
      end

    end

    context 'when there is no log' do

      it 'returns 0' do
        expect(subject.task3('')).to eq('0')
      end

    end
    
  end

  describe '#pars' do
    
    let(:log) do
      <<~LOGS
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
        2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
        2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
        2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
        2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event
      LOGS
    end

    let(:result) do
      [
        "2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event",
        "2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages"
      ]
    end

    it 'returns an array of strings with \"Coling core\" from log' do
      expect(subject.pars(log)).to eq(result)
    end

  end

  describe '#true_strs' do

    let(:log) do
      [
        "2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event",
        "2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages"
      ]
    end

    let(:result) do
      [[2018.0, 4.0, 23.0, 17.0, 17.0, 49.7], [2018.0, 4.0, 23.0, 17.0, 18.0, 38.8]]
    end

    it 'returns an array of arrays with splited data/time' do
      expect(subject.true_strs(log)).to eq(result)
    end

  end

  describe '#time' do

    let(:log) do
        [[2018.0, 4.0, 23.0, 17.0, 17.0, 49.7], [2018.0, 4.0, 23.0, 17.0, 18.0, 38.8]]
    end

    let(:result) do
      <<~RESULT
        [2018-04-23 17:17:49.71 UTC, 2018-04-23 17:18:38.8 UTC]
      RESULT
    end

    it 'returns an array of time from splited array of arrays' do
      expect(subject.time(log).to_s).to eq(result.chomp)
    end

  end

  describe '#res' do

    let(:log) do
      [[2018.0, 4.0, 23.0, 17.0, 17.0, 49.7], [2018.0, 4.0, 23.0, 17.0, 18.0, 38.8]]
    end

    let(:result) do
      ["49.1"] 
    end

    it 'returns an array of time from splited array of arrays' do
      expect(subject.res(subject.time(log))).to eq(result)
    end

  end

end
