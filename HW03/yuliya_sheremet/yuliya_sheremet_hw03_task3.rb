# HW03/task3.rb
# frozen_string_literal: true

require 'rubocop'
require 'date'
require 'time'

class Homework3
  def task3(logs)
    array_of_strings = logs.split(/\n/)
    cases_for_output(logs, array_of_strings)
  end

  def cases_for_output(logs, array_of_strings)
    if logs.scan('Calling core').length > 1
      if_include(array_of_strings)
      seconds = array_of_strings
      check_and_print(seconds)
    else
      puts '0'
    end
  end

  def print_a(seconds)
    arr = []
    i = 0
    print arr << (Time.parse(seconds[i + 1]) - Time.parse(seconds[i])).to_s
  end

  def print_b(seconds)
    arr = [] << (Time.parse(seconds[1]) - Time.parse(seconds[0])).to_s
    print arr << (Time.parse(seconds[2]) - Time.parse(seconds[1])).to_s
  end

  def check_and_print(seconds)
    if seconds.size <= 2
      print_a(seconds)
    elsif seconds.size > 2
      print_b(seconds)
    end
  end

  def if_include(array_of_strings)
    array_of_strings.select! { |line| line.include? 'Calling core' }
    array_of_strings.map! do |p|
      data = p.split(' ')
      [data[0], data[1]].join(' ')
    end
  end
end
