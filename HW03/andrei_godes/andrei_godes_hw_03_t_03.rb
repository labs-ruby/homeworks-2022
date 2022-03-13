# frozen_string_literal: true

require 'time'
class Homework3
  def task3(logs)
    subtraction(include_string(logs))
  end

  def include_string(string)
    sel = string.split("\n").select do |select_calling|
      select_calling.include?('Calling core with action:')
    end
    sel.map { |data_str| Time.parse(data_str) }
  end

  def subtraction(array)
    array.length <= 1 ? 0 : array.each_cons(2).map { |a, b| (b - a) }
  end
end
