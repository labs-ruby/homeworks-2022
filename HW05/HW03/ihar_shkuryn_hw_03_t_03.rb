# frozen_string_literal: true

require 'time'

# frozen
class Homework3
  PATTERN = /Calling core with action:/
  def task3(log)
    raise ArgumentError, 'Only string are allowed' unless log.is_a?(String)

    durations = log.split("\n").select { |line| line.match(PATTERN) }
                   .map { |line| Time.parse(line) }
                   .each_cons(2).map { |a, b| (b - a).to_s }

    output_answer(durations)
  end

  private

  def output_answer(durations)
    if durations.size > 1
      durations
    else
      durations.size == 1 ? durations[0] : '0'
    end
  end
end
