# frozen_string_literal: true

class Homework3
  def task4(log, result = {})
    result[:letters] = log.downcase.count 'a-z'
    result[:digits] = log.count '0-9'

    result
  end
end
