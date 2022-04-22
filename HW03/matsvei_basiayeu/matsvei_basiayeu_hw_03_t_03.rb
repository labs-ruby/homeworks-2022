# frozen_string_literal: true

require 'time'

# this Homework3
class Homework3
  def task3(log)
    return '0' if log.nil?
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
    array.length
    array.each_with_index.map do |_i, index|
      return array if index >= array.length - 1

      array[index] = (array[index + 1] - array[index]).to_s
    end
  end

  def return_result(res_arr)
    res_arr.delete(res_arr.last)
    res_arr.length == 1 ? res_arr.first.to_s : res_arr
  end
end
