# frozen_string_literal: true

require 'time'

# this Homework3
class Homework3
  def task3(log)
    return '0' if check_required_lines(log).size < 2

    return_result(result_array(parsing_time(log)))
  end

  private

  def parsing_time(log)
    check_required_lines(log).map { |string| Time.parse(string) }
  end

  def check_required_lines(log)
    log.split("\n").select { |string| string != '' && string.include?('Calling core with action:') }
  end

  def result_array(array)
    res = []
    len = array.length
    array.each_with_index do |_i, index|
      return res if index >= len - 1

      res << (array[index + 1] - array[index]).to_s
    end
  end

  def return_result(result_arr)
    result_arr.length == 1 ? result_arr.first.to_s : result_arr
  end
end
