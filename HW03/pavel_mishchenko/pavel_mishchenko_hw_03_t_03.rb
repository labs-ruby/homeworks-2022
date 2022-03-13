# frozen_string_literal: true

require 'time'

REGEX_DATE = /(\d+-\d+\d-\d+ \d+:\d+:\d+.\d+)/
class Homework3
  def task3(log)
    arr = convert_to_time(core_actions(log))
    duration_of_actions(arr)
  end

  private

  def core_actions(str)
    str.lines(chomp: true).select { |line| line.include?('Calling core with action:') }
  end

  def convert_to_time(arr)
    arr.map { |line| Time.parse(line.scan(REGEX_DATE).flatten.first) }
  end

  def duration_of_actions(arr)
    if arr.empty? || arr.length < 2
      '0'
    else
      arr.length == 2 ? arr.inject(:-).abs.to_s : Array.new(arr.length - 1) { |i| (arr[i + 1] - arr[i]).to_s }
    end
  end
end
