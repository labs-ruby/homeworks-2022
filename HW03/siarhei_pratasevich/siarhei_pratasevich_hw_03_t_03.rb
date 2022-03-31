# frozen_string_literal: true

require 'time'
class Homework3
  def task3(log)
    return '0' if !log.is_a?(String) || total_lines(log).size <= 1

    array = total_lines(log).map { |string| Time.parse(string) }
    result_array(array).size == 1 ? result_array(array).join : result_array(array)
  end

  private

  def result_array(array)
    array.each_with_index
         .reduce([]) { |memo, (element, index)| array[index + 1] ? memo.push((array[index + 1] - element).to_s) : memo }
  end

  def total_lines(log)
    log.split("\n").select { |string| string.include?('Calling core with action:') && right_format?(string) }
  end

  def right_format?(string)
    string.match?(/\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}.\d \w+-\w+\[\d+\] \w+ - \w+ \w+ \w+ \w+: \w+/)
  end
end
