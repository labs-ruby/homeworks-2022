# HW03/task1.rb
# frozen_string_literal: true

class Homework3
  def task1(log)
    array_of_strings = log.split(/\n/)
    if log.include?('error')
      array_of_strings.select! { |line| line.include? 'error' }
      array_of_strings[0]
    else
      ''
    end
  end
end
