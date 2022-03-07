# frozen_string_literal: true

require 'time'
class Homework3
  def task3(logs)
    calculated_time = calculate_event_time(make_start_time(logs))
    case calculated_time.length
    when 0
      '0'
    when 1
      calculated_time[0]
    when (2..)
      calculated_time
    end
  end

  private

  def make_start_time(logs)
    logs.split("\n").select { |string| string.include?('Calling core with action:') }
        .map { |string| Time.parse(string) }
  end

  def calculate_event_time(start_time, result = [])
    (start_time.size - 1).times { |index| result << (start_time[index + 1] - start_time[index]).round(1).to_s }
    result
  end
end
