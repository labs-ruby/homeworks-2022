# frozen_string_literal: true

require 'time'

class Homework3
  def task3(logs)
    arr = logs.split("\n").select { |v| v.include? 'Calling core with action' }.map { |x| Time.parse(x) }

    return '0' if arr.length < 2

    time_difference = arr.each_cons(2).map { |x, y| (x - y).abs.to_s }

    arr.length == 1 ? time_difference[0] : time_difference
  end
end
