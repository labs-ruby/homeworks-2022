# frozen_string_literal: true

class Homework3
  def task4(log, output = {})
    count_letters = log.count 'a-zA-Z'
    count_digits = log.count '0-9'
    output[:letters] = count_letters
    output[:digits] = count_digits
    output
  end
end
