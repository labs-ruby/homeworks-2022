# frozen_string_literal: true

require 'time'
class Homework3
  def task3(log)
    make_output(log)
  end

  private

  def choose_calling_lines(log)
    log.split("\n").select { |x| x.include?('Calling') }.map { |x| Time.parse(x) }
  end

  def make_array_with_durations(log)
    durations_array = choose_calling_lines(log)
    (durations_array.length - 1).times do |i|
      durations_array[i] = (durations_array[i + 1].to_f - durations_array[i].to_f).round(1).to_s
    end
    durations_array.delete_if { |x| x.instance_of?(Time) }
  end

  def make_output(log)
    output_array = make_array_with_durations(log)
    case output_array.length
    when 0
      '0'
    when 1
      output_array[0]
    else
      output_array
    end
  end
end
