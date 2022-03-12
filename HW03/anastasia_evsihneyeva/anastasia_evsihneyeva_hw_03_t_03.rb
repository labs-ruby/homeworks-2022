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