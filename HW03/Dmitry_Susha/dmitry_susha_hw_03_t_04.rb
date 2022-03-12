# frozen_string_literal: true

class Homework3
  def task4(string)
    letters = string.count('a-zA-Z')
    digits = string.count('0-9')
    { letters: letters, digits: digits }
  end
end
