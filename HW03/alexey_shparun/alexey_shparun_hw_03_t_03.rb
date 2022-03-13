# frozen_string_literal: true

require 'time'
class Homework3
  def task3(logs)
    array = time_result(validation(logs))
    if result(array).length == 1
      result(array)[0]
    else
      result(array)
    end
  end

  def validation(logs)
    logs.split("\n").find_all { |string| string.include?('Calling core with action:') }
  end

  def time_result(array)
    array.map { |str| Time.parse(str) }
  end

  def result(array)
    return '0' if array.length <= 1

    array.each_cons(2).map { |a, b| (b - a).to_s }
  end
end
