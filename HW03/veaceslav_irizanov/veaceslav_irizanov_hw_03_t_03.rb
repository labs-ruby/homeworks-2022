# frozen_string_literal: true

require 'time'

class Homework3
  ZERO_S = '0'
  ONE = 1

  def task3(log)
    rasult_array = time_line(total_rows(log))
    array_of_duration(rasult_array).size == ONE ? array_of_duration(rasult_array)[0] : array_of_duration(rasult_array)
  end

  private

  def total_rows(log)
    log.split("\n").select { |var| var.include?('Calling core with action') }
  end

  def time_line(array)
    array.collect { |line| Time.parse(line) }
  end

  def array_of_duration(array)
    return ZERO_S if array.size <= ONE

    array.each_cons(2).map { |a, b| (b - a).to_s }
  end
end
