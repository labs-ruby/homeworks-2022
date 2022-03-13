# frozen_string_literal: true

require 'time'
class Homework3
  def task3(log)
    if valid_lines(log).size <= 1
      '0'
    else
      arr = valid_lines(log).map { |line| Time.parse(line) }
      get_result(arr).size == 1 ? get_result(arr).join : get_result(arr)
    end
  end

  def valid_lines(log)
    log.split("\n").select { |line| line.include?('Calling core with action:') }
  end

  def get_result(arr)
    arr.each_cons(2).map { |a, b| (b - a).to_s }
  end
end
