# frozen_string_literal: true

require 'time'

class Homework3
  def task3(log)
    lines = log.split(/\n/)
    lines.select! { |line| event_valid?(line) }.map! { |line| Time.parse(line) }

    return '0' if lines.empty? || lines.size == 1

    duration(lines.compact)
  end

  private

  def event_valid?(string)
    string.include?('Calling core with action') ? true : false
  end

  def duration(events)
    events.map!.with_index { |_event, index| (events[index + 1] - events[index]).to_s unless events[index + 1].nil? }
    return '0' if events.compact == []
    return events[0] if events.compact.size == 1

    events.compact
  end
end
