# HW03/task4.rb
# frozen_string_literal: true

class Homework3
  def task4(string)
    letters = string.count 'a-zA-Z'
    digits = string.count '0-9'
    puts "letters: #{letters}, digits: #{digits}"
  end
end
