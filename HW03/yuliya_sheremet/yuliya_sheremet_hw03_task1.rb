# HW03/task1.rb
# frozen_string_literal: true

class Homework3
  def task1(logs)
    array_of_strings = logs.split(/\n/)
    if logs.include?('error')
      array_of_strings.select! { |line| line.include? 'error' }
      print array_of_strings[0].strip
    else
      puts ''
    end
  end
end
