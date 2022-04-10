# frozen_string_literal: true

require 'time'
class Homework3
  START_EVENT_LINE = /Calling core with action:/
  def task3(logs)
    return '0' unless logs.is_a?(String)

    lines = logs.split("\n")
    start_event_lines = lines.select { |string| string.match?(START_EVENT_LINE) }
    return '0' if start_event_lines.size < 2

    start_time = start_event_lines.map { |string| Time.parse(string) }
    differences = calculate_event_time(start_time)
    make_output(differences)
  end

  private

  def calculate_event_time(start_time, result = [])
    (start_time.size - 1).times { |index| result << (start_time[index + 1] - start_time[index]).round(1).to_s }
    result
  end

  def make_output(differences)
    if differences.size > 1
      differences
    else
      differences[0]
    end
  end
end
