# frozen_string_literal: true

require 'time'
class Homework3
  PATTERN = /Calling core with action:/
  def task3(log)
    arr_lines = find_lines_by_pattern log
    return '0' if arr_lines.empty?

    get_durations arr_lines
  end

  def get_durations(arr_lines)
    durations = []
    arr = arr_lines.map { |line| Time.parse(line) }
    arr.each_with_index do |num, idx|
      durations << (arr[idx + 1] - num).to_s if idx < arr.size - 1
    end
    return '0' if durations.empty?

    durations.size > 1 ? durations : durations.join
  end

  def find_lines_by_pattern(log)
    arr = []
    log.split("\n").each do |line|
      arr << line unless line.match(PATTERN).nil?
    end
    arr
  end
end
