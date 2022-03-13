# frozen_string_literal: true

require 'time'
class Homework3
  def task3(logs)
    array = include_string(logs)
    if subtraction(array).length == 1
      subtraction(array)[0]
    else
      subtraction(array)
    end
  end

  def include_string(string)
    string_select = string.split("\n").find_all do |select_calling|
      select_calling.include?('Calling core with action:')
    end
    string_select.map { |data_str| Time.parse(data_str) }
  end

  def subtraction(array)
    array.length <= 1 ? '0' : array.each_cons(2).map { |a, b| (b - a).to_s }
  end
end
