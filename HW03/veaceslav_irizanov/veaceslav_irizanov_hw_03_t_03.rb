# frozen_string_literal: true

require 'time'

class Homework3
  def task3(log)
    return '0' if total_rows(log).size < 2

    time_line = total_rows(log).map { |line| Time.parse(line).to_f }.reverse
    results(time_line).size > 1 ? results(time_line).reverse! : results(time_line)[0].to_s
  end

  private

  def total_rows(log)
    rows = log.split("\n")
    rows.select { |var| var.include?('Calling') }
  end

  def results(arr)
    i = 0
    result = []
    while i < arr.size - 1
      i += 1
      result << (arr[i - 1] - arr[i]).round(1).to_s
    end
    result
  end
end
