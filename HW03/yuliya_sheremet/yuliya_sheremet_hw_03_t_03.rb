# HW03/task3.rb
# frozen_string_literal: true

require 'date'
require 'time'

class Homework3
  def task3(log)
    array_of_strings = log.split(/\n/)
    cases_for_output(log, array_of_strings)
  end

  def cases_for_output(logs, array_of_strings)
    if logs.scan('Calling core').length > 1
      include_calling_core?(array_of_strings)
      seconds = array_of_strings
      print(seconds)
    else
      '0'
    end
  end

  def one_value(seconds)
    (Time.parse(seconds[1]) - Time.parse(seconds[0])).to_s
  end

  def two_values(seconds)
    arr = [] << (Time.parse(seconds[1]) - Time.parse(seconds[0])).to_s
    arr << (Time.parse(seconds[2]) - Time.parse(seconds[1])).to_s
  end

  def print(seconds)
    seconds.size <= 2 ? one_value(seconds) : two_values(seconds)
  end

  def include_calling_core?(array_of_strings)
    array_of_strings.select! { |line| line.include? 'Calling core' }
                    .map do |line|
      line.split(' ')[0..1].join(' ')
    end
  end
end
