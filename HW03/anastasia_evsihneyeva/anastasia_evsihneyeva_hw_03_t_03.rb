# frozen_string_literal: true

require 'time'
require 'set'

class Homework3
  NUMS = /(.*)(?=\ ub)/
  SPLIT = /[\ :-]/
  def task3(logs)
    logs = logs.split("\n").select { |log| log.include?('core with action') }
    return '0' if logs.length < 2

    times = []
    results = []
    logs.each do |log|
      times << Time.gm(*NUMS.match(log).to_s.split(SPLIT).map(&:to_f))
    end

    (0..times.length - 2).each do |i|
      results << (times[i + 1] - times[i]).round(1).to_s
    end

    results.length == 1 ? results[0] : results
  end
end

logs = "2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - Calling core with action: event
2018-04-23 17:17:49.7 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:17:49.8 ubuntu-xenial[14319] Debug - docker event processed
2018-04-23 17:18:19.5 ubuntu-xenial[14319] Debug - monitoring grid communication health
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - Calling core with action: messages
2018-04-23 17:18:38.8 ubuntu-xenial[14319] Debug - connecting to: 10.6.246.101
2018-04-23 17:18:59.8 ubuntu-xenial[14319] Debug - inside docker_handle_event"

puts Homework3.new.task3(logs)