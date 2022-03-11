# frozen_string_literal: true

class Homework3
  def task4(log)
    res = {}
    res[:letters] = log.downcase.count 'a-zA-Z'
    res[:digits] = log.count '0-9'
    res
  end
end
