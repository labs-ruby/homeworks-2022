# frozen_string_literal: true

class Homework3
  def task3(logs)
    start_string = select_start_event(logs)
    start_time = make_start_time(start_string)
    seconds = convert_to_seconds(start_time)
    calculated_time = calculate_event_time(seconds)
    make_output(calculated_time)
  end

  private

  def select_start_event(logs)
    logs.split("\n").select { |string| string.include?('Calling core with action:') }
  end

  def make_start_time(start_string)
    start_string.map { |string| string.split(' ')[1].split(':')[1..].join(' ') }
  end

  def convert_to_seconds(start_time, result = [])
    start_time.reverse!.size.times do |index|
      result << start_time[index][0..1].to_f * 60 + start_time[index][3..].to_f
    end
    result
  end

  def calculate_event_time(seconds, result = [])
    (seconds.size - 1).times { |index| result << (seconds[index] - seconds[index + 1]).round(1).to_s }
    result.reverse!
  end

  def make_output(calculated_time)
    case calculated_time.length
    when 0
      '0'
    when 1
      calculated_time[0]
    when (2..)
      calculated_time
    end
  end
end
