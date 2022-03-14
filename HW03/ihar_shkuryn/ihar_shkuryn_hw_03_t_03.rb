# frozen_string_literal: true

require 'time'

class Homework3
  PATTERN = /Calling core with action:/
  def task3(log)
    array_lines = log.split("\n")
    durations = array_lines.select { |x| x.match(PATTERN) }
                           .map { |line| Time.parse(line) }
                           .each_cons(2).map { |a, b| (b - a).to_s }
    if durations.size > 1
      durations
    else
      durations.size == 1 ? durations[0] : '0'
    end
  end
end
