# frozen_string_literal: true

require 'time'

class Homework3
  ZERO_S = '0'
  ZERO_I = 0
  ONE = 1
  TWO = 2
  CONDITION = 'Calling core with action'

  def task3(log)
    return ZERO_S if total_rows(log).size < TWO

    time_line = total_rows(log).map { |line| Time.parse(line).to_f }.reverse
    results(time_line).size > ONE ? results(time_line).reverse! : results(time_line)[0].to_s
  end

  private

  def total_rows(log)
    rows = log.split("\n")
    rows.select { |var| var.include?(CONDITION) }
  end

  def results(arr)
    iterator = ZERO_I
    result = []
    while iterator < arr.size - ONE
      iterator += ONE
      result << (arr[iterator - ONE] - arr[iterator]).round(ONE).to_s
    end
    result
  end
end
