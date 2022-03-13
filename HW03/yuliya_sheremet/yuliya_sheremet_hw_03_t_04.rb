# HW03/task4.rb
# frozen_string_literal: true

class Homework3
  def task4(log)
    data = {}
    data[:letters] = log.count 'a-zA-Z'
    data[:digits] = log.count '0-9'
    data
  end
end
