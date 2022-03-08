# frozen_string_literal: true

class Homework3
  def change(arr)
    arr.map { |el| el.to_s.match(/^.+?(?=\s).+?(?=\s)/) }
       .map { |el| el.to_s.scan(/\d+\.?\d/).flatten }
       .map { |el| Time.new(el[0], el[1], el[2], el[3], el[4], el[5].to_f) }
  end

  def changing_time(arr)
    result = []
    index = 1
    while index < arr.length
      result << format('%.1f', arr[index] - arr[index - 1])
      index += 1
    end
    return result[0] if result.size == 1

    result
  end

  def task3(data_log)
    array_with_call = data_log.split("\n").select { |el| el.include?('Calling core with action:') }
    return '0' if array_with_call.length <= 1

    correct_lines = change(array_with_call)
    changing_time(correct_lines)
  end
end
