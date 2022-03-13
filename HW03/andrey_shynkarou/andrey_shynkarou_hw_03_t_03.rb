# frozen_string_literal: true

require 'time'
class Homework3
  def initialize
    @time_match = /\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2}\.\d/
  end

  def event_time(log)
    log.lines
       .select { |s| s.include?('action') }
       .map { |s| s[@time_match] }
       .map { |s| Time.parse(s) }
  end

  def subtract_time(log_time)
    log_time.each_with_index
            .map { |x, i| (log_time[i + 1] - x).to_s if i < (log_time.length - 1) }
            .select
            .with_index { |_x, i| i != (log_time.length - 1) }
  end

  def answer(arr)
    return arr.first if arr.length == 1

    arr if arr.length != 1
  end

  def task3(log)
    event_time(log).length <= 1 ? '0' : answer(subtract_time(event_time(log)))
  end
end
