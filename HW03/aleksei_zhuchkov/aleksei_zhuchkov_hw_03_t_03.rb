# frozen_string_literal: true

class Homework3
  TIME_SCAN = /\d+\.?\d/

  def change(arr)
    arr.map do |el|
      time_data = el.to_s.scan(TIME_SCAN).flatten
      Time.new(time_data[0], time_data[1], time_data[2], time_data[3], time_data[4], time_data[5].to_f)
    end
  end

  def changing_time(arr)
    result = []
    arr.each_cons(2) { |el, el_next| result << format('%.1f', el_next - el) }
    result
  end

  def task3(data_log)
    array_with_call = data_log.split("\n").select { |el| el.include?('Calling core with action:') }
    correct_lines = change(array_with_call)

    return '0' if correct_lines.size < 2

    result = changing_time(correct_lines)
    result.size == 1 ? result[0] : result
  end
end
