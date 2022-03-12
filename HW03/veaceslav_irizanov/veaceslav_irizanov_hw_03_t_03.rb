# frozen_string_literal: true

require 'time'

class Homework3
  ZERO_S = '0'
  ONE = 1
  TWO = 2
  CONDITION = 'Calling core with action'

  def task3(log)
    return ZERO_S if total_rows(log).size < TWO

    time_line = total_rows(log).map { |line| Time.parse(line) }
    results(time_line).size > ONE ? results(time_line) : results(time_line).join
  end

  private

  def total_rows(log)
    log.split("\n").select { |var| var.include?(CONDITION) }
  end

  def results(array)
    array.each_with_index
         .inject([]) { |memo, (element, index)| array[index + 1] ? memo.push((array[index + 1] - element).to_s) : memo }
  end
end
