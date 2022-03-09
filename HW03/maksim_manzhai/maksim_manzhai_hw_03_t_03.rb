# frozen_string_literal: true

require 'time'

class Homework3
  def task3(log)
    lines = log.split(/\n/)
    temp_array = []
    lines.each do |line|
      temp_array << Time.parse(line) if event_valid?(line)
    end
    return '0' if temp_array.empty?

    return '0' if temp_array.size == 1

    duration(temp_array)
  end

  private

  def event_valid?(string)
    string.include?('Calling core with action') ? true : false
  end

  def duration(events)
    temp_array = []
    (0...events.size).each do |i|
      temp_array << (events[i + 1] - events[i]).to_s unless events[i + 1].nil?
    end
    return temp_array[0] if temp_array.size == 1

    temp_array
  end
end
