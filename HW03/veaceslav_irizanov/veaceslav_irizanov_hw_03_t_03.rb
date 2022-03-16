# frozen_string_literal: true

require 'time'

class Homework3
  def task3(log)
    final_array = array_of_duration(time_line(total_rows(log)))
    final_array.size == 1 ? final_array[0] : final_array
  end

  private

  def total_rows(log)
    log.split("\n").select { _1.include?('Calling core with action') }
  end

  def time_line(lines)
    lines.collect { |line| Time.parse(line) }
  end

  def array_of_duration(array)
    return '0' if array.size <= 1

    array.each_cons(2).map { |a, b| (b - a).to_s }
  end
end
