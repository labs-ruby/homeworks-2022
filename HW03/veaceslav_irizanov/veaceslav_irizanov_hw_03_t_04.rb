# frozen_string_literal: true

class Homework3
  def task4(log)
    letter = log.count 'a-zA-Z'
    digit = log.count '0-9'
    { digits: digit, letters: letter }
  end
end
